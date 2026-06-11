/**
 * Ordine e metadati per la navigazione della sezione docs.
 * Mantenuto centralizzato per coerenza sidebar + indice.
 *
 * Aggiungi qui una nuova pagina docs/ per farla comparire nella sidebar.
 */
export const docsNav = [
  { slug: 'come-contribuire',     title: 'Come contribuire' },
  { slug: 'dataset-project-flow', title: 'Flusso dataset / progetto' },
  { slug: 'governance-model',     title: 'Modello di governance' },
  { slug: 'glossario',            title: 'Glossario' },
  { slug: 'domande-frequenti',    title: 'Domande frequenti' },
  { slug: 'local-setup',          title: 'Setup locale' },
];

/** Recupera indice e link prev/next per una slug. */
export function getNavContext(slug) {
  const idx = docsNav.findIndex((e) => e.slug === slug);
  if (idx === -1) return { current: null, prev: null, next: null };
  return {
    current: docsNav[idx],
    prev: idx > 0 ? docsNav[idx - 1] : null,
    next: idx < docsNav.length - 1 ? docsNav[idx + 1] : null,
  };
}
