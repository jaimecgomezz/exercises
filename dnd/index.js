var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
var roll = function () { return Math.floor(Math.random() * 6); };
var dices = function (n) { return __spreadArray([], Array(n), true).map(roll); };
var score = function (rolls, top) {
    if (rolls === void 0) { rolls = 4; }
    if (top === void 0) { top = 3; }
    return dices(rolls).sort(function (a, b) { return a - b; }).slice(0, top + 1).reduce(function (a, b) { return a + b; });
};
var generate = function () {
    return {
        strength: score(),
        dexterity: score(),
        constitution: score(),
        intelligence: score(),
        wisdom: score(),
        charisma: score()
    };
};
console.log(generate());
// source: https://exercism.org/tracks/typescript/exercises/dnd-character
