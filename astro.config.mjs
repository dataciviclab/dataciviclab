import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://dataciviclab.github.io',
  base: '/dataciviclab',
  trailingSlash: 'always',
  image: {
    service: { entrypoint: 'astro/assets/services/noop' },
  },
});
