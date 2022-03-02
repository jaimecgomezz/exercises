const roll = () => Math.floor(Math.random() * 6);
const dices = (n) => [...Array(n)].map(roll);
const score = (rolls = 4, top = 3) => dices(rolls).sort((a, b) => a - b).slice(0, top + 1).reduce((a, b) => a + b);
const generate = () => {
  return {
    strength: score(),
    dexterity: score(),
    constitution: score(),
    intelligence: score(),
    wisdom: score(),
    charisma: score()
  }
}

console.log(generate());

// source: https://exercism.org/tracks/typescript/exercises/dnd-character
