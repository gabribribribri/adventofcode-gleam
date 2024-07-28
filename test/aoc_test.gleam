import day2
import gleeunit
import gleeunit/should

import day1

pub fn main() {
  gleeunit.main()
}

pub fn day1_part1_test() {
  "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"
  |> day1.part1
  |> should.equal(142)
}

pub fn day1_part2_test() {
  "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"
  |> day1.part2
  |> should.equal(281)
}

pub fn day2_part1_test() {
  "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"
  |> day2.part1
  |> should.equal(8)
}

pub fn day2_part2_test() {
  "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
  |> day2.part2
  |> should.equal(2286)
}
