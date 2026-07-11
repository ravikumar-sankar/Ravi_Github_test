import { main } from '../src/index';

describe('main', () => {
  it('exists and is callable', () => {
    expect(typeof main).toBe('function');
    expect(() => main()).not.toThrow();
  });
});
