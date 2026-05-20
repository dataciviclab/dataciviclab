import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://dataciviclab.org',
  base: '',
  trailingSlash: 'always',
  image: {
    service: { entrypoint: 'astro/assets/services/noop' },
  },
});
