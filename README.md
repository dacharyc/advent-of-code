# 2022

2022 is my first year attempting Advent of Code. I'm solving these puzzles in Swift, and where possible, using the [Realm Database Swift SDK](https://www.mongodb.com/docs/realm/sdk/swift/). I know it's ridiculous and unnecessary, but I write documentation for the Realm Swift SDK as my day job, and I love it a lot, so it's fun to use it in side projects.

I also write for a living, so I am infusing my code with a little more - personality. I'm not trying to optimize for tiny, efficient solutions - I want to have fun.

## Structure

I'm not building an app, so I didn't want to use an app target. I may have complicated my life, but I'm just writing my solutions as unit tests.

Input files are in `AoC-Tests-2022/Inputs`.
Solutions are in files named for the day in `AoC-Tests-2022`.
For fun, I'm also keeping track of output files in `AoC-Outputs-2022`. I'll be printing to the console for my entertainment, and maybe yours? And will also include how long it took to run each test.

## Puzzles

- Day 1, Puzzle 1: Elves are carrying snacks into the woods. Elves have names! Their snacks have names! Let's overcomplicate this with a dictionary of snack names and calorie values that each named elf is carrying.