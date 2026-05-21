/**
 * Smoke test: verifica che il build Astro completi senza errori.
 * Usa il test runner nativo di Node.js.
 */
import { describe, it } from 'node:test';
import { execSync } from 'node:child_process';
import assert from 'node:assert';

describe('Astro build', () => {
  it('should complete without errors', () => {
    const output = execSync('npm run build 2>&1', {
      encoding: 'utf-8',
      timeout: 120_000,
    });
    assert.ok(
      output.includes('Complete!'),
      `Build output should contain "Complete!"\n\n${output.slice(-500)}`
    );
  });
});
