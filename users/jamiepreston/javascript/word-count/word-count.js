export const countWords = phrase =>
  phrase
    .toLowerCase()
    .replace(/[\n:!&@$%^.]|'(\w+)'|^ +|^,+/g, '$1')
    .split(/[\s,]+/)
    .filter(x => x)
    .reduce((acc, word) => {
          acc[word] = (acc[word] ?? 0) + 1;
          return acc;
    },{})
