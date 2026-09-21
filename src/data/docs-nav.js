/**
 * Ordine e metadati per la navigazione della sezione docs.
 * Mantenuto centralizzato per coerenza sidebar + indice.
 *
 * Aggiungi qui una nuova pagina docs/ per farla comparire nella sidebar.
 */
export const docsNav = [
  { slug: 'come-contribuire',     title: 'Come contribuire',     group: 'Iniziare' },
  { slug: 'dataset-project-flow', title: 'Flusso dataset',       group: 'Iniziare' },
  { slug: 'governance-model',     title: 'Governance',           group: 'Iniziare' },
  { slug: 'domande-frequenti',    title: 'Domande frequenti',    group: 'Approfondire' },
  { slug: 'glossario',            title: 'Glossario',            group: 'Reference' },
  { slug: 'local-setup',          title: 'Setup locale',         group: 'Reference' },
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
