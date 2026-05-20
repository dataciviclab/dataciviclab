/**
 * Loader KPI del Lab — usato in build-time da componenti Astro.
 * Legge artifact JSON pubblici da dataset-incubator e source-observatory.
 * Fallisce silently: se un artifact non è raggiungibile, ritorna null.
 */

const CATALOG_URL =
  "https://raw.githubusercontent.com/dataciviclab/dataset-incubator/main/registry/clean_catalog.json";

const RADAR_URL =
  "https://raw.githubusercontent.com/dataciviclab/source-observatory/main/data/radar/radar_summary.json";

/**
 * Legge clean_catalog.json e restituisce conteggi per stage.
 * @returns {{ total: number, published: number, incubating: number } | null}
 */
export async function fetchCatalogStats() {
  try {
    const res = await fetch(CATALOG_URL);
    if (!res.ok) return null;
    const data = await res.json();
    const datasets = data.datasets || [];
    return {
      total: datasets.length,
      published: datasets.filter((d) => d.stage === "published").length,
      incubating: datasets.filter((d) => d.stage === "incubating").length,
    };
  } catch {
    return null;
  }
}

/**
 * Legge radar_summary.json e restituisce stato delle fonti.
 * @returns {{ total: number, green: number, yellow: number, red: number } | null}
 */
export async function fetchRadarStats() {
  try {
    const res = await fetch(RADAR_URL);
    if (!res.ok) return null;
    const data = await res.json();
    const sources = data.sources || [];
    const statusCounts = data.status_counts || {};
    return {
      total: sources.length,
      green: statusCounts.GREEN || 0,
      yellow: statusCounts.YELLOW || 0,
      red: statusCounts.RED || 0,
    };
  } catch {
    return null;
  }
}

/**
 * Legge clean_catalog.json e restituisce un Set di slug dei dataset pubblicati.
 * Utile per verificare se un'analisi ha un dataset corrispondente su explorer.
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
