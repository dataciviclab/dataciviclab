/**
 * Loader KPI del Lab — usato in build-time da componenti Astro.
 * Legge artifact JSON pubblici da dataset-incubator e source-observatory.
 * Se gli artifact non sono raggiungibili, usa dati fallback noti e logga un warning.
 */

const CATALOG_URL =
  "https://raw.githubusercontent.com/dataciviclab/dataset-incubator/main/registry/clean_catalog.json";

const RADAR_URL =
  "https://raw.githubusercontent.com/dataciviclab/source-observatory/main/data/radar/radar_summary.json";

/** Dati fallback (ultimi valori noti, usati se GitHub raw non risponde) */
const FALLBACK_CATALOG = { total: 19, published: 7, incubating: 12 };
const FALLBACK_RADAR = { total: 14, green: 8, yellow: 3, red: 3 };

/**
 * Legge clean_catalog.json e restituisce conteggi per stage.
 * @returns {{ total: number, published: number, incubating: number }}
 */
export async function fetchCatalogStats() {
  try {
    const res = await fetch(CATALOG_URL);
    if (!res.ok) {
      console.warn("[lab-stats] clean_catalog.json non raggiungibile, uso fallback");
      return FALLBACK_CATALOG;
    }
    const data = await res.json();
    const datasets = data.datasets || [];
    return {
      total: datasets.length,
      published: datasets.filter((d) => d.stage === "published").length,
      incubating: datasets.filter((d) => d.stage === "incubating").length,
    };
  } catch (err) {
    console.warn("[lab-stats] clean_catalog.json fetch fallito:", err.message, "— uso fallback");
    return FALLBACK_CATALOG;
  }
}

/**
 * Legge radar_summary.json e restituisce stato delle fonti.
 * @returns {{ total: number, green: number, yellow: number, red: number }}
 */
export async function fetchRadarStats() {
  try {
    const res = await fetch(RADAR_URL);
    if (!res.ok) {
      console.warn("[lab-stats] radar_summary.json non raggiungibile, uso fallback");
      return FALLBACK_RADAR;
    }
    const data = await res.json();
    const sources = data.sources || [];
    const statusCounts = data.status_counts || {};
    return {
      total: sources.length,
      green: statusCounts.GREEN || 0,
      yellow: statusCounts.YELLOW || 0,
      red: statusCounts.RED || 0,
    };
  } catch (err) {
    console.warn("[lab-stats] radar_summary.json fetch fallito:", err.message, "— uso fallback");
    return FALLBACK_RADAR;
  }
}

/**
 * Legge clean_catalog.json e restituisce un Set di slug dei dataset pubblicati.
 * Utile per verificare se un'analisi ha un dataset corrispondente su explorer.
 * Se il fetch fallisce, ritorna Set vuoto (nessun badge "Su Explorer" mostrato).
 * @returns {Promise<Set<string>>}
 */
export async function fetchPublishedSlugs() {
  try {
    const res = await fetch(CATALOG_URL);
    if (!res.ok) return new Set();
    const data = await res.json();
    const datasets = data.datasets || [];
    const published = datasets
      .filter((d) => d.stage === "published")
      .map((d) => d.slug);
    return new Set(published);
  } catch {
    return new Set();
  }
}
