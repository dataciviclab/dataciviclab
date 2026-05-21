import rss from '@astrojs/rss';
import { statSync } from 'node:fs';

/**
 * Feed RSS delle analisi pubbliche di DataCivicLab.
 * Generato in build-time, ordinato per data di modifica del README (più recente prima).
 */
export async function GET(context) {
  const modules = import.meta.glob('/analisi/*/README.md', { eager: true });

  const items = Object.entries(modules)
    .filter(([path]) => !path.includes('/_template/') && !path.includes('/registry/'))
    .map(([path, mod]) => {
      const slug = path.split('/').slice(-2, -1)[0];
      const fm = mod.frontmatter ?? {};

      // Data: dal frontmatter se presente, altrimenti mtime del file
      let pubDate;
      if (fm.date) {
        pubDate = new Date(fm.date);
      } else {
        try {
          const stats = statSync(path);
          pubDate = stats.mtime;
        } catch {
          pubDate = new Date();
        }
      }

      return {
        title: fm.title || slug,
        description: fm.description || '',
        link: `${context.site}analisi/${slug}/`,
        pubDate,
      };
    })
    .sort((a, b) => b.pubDate.getTime() - a.pubDate.getTime());

  return rss({
    title: 'DataCivicLab — Analisi',
    description:
      'Analisi pubbliche del DataCivicLab: dati, notebook e finding su dati pubblici italiani.',
    site: context.site,
    items,
    customData: `<language>it</language>`,
  });
}
