import gleeunit
import gleeunit/should

import day1

pub fn main() {
  gleeunit.main()
}

pub fn day1_test() {
  let data_part1 =
    "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet"
  let data_part2 =
    "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"
  day1.part1(data_part1) |> should.equal(142)
  day1.part2(data_part2) |> should.equal(282)
}
