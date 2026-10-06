/**
 * Sorgente unica per i progetti pubblicati (schede projects/).
 * Usato da homepage (StatusBar) ed ecosistema — stesso glob di progetti/index.astro.
 */
const projectModules = import.meta.glob("/projects/*.md", { eager: true });

function slugFromPath(filepath) {
  const parts = filepath.split("/");
  const filename = parts[parts.length - 1] ?? "";
  return filename.replace(/\.md$/, "");
}

/** Elenco progetti pubblicati (esclude README.md), ordinato per slug. */
export function listPublishedProjects() {
  return Object.entries(projectModules)
    .filter(([filepath]) => !filepath.endsWith("/README.md"))
    .map(([filepath, mod]) => {
      const slug = slugFromPath(filepath);
      const fm = mod?.frontmatter ?? {};
      return {
        slug,
        title: fm.title || slug,
        description: fm.description || "",
        repo: fm.repo || `dataciviclab/${slug}`,
      };
    })
    .sort((a, b) => a.slug.localeCompare(b.slug));
}

/** Conteggio schede projects/ — badge homepage ed ecosistema. */
export const publishedProjectCount = listPublishedProjects().length;
