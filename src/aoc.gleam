import day1
import gleam/int
import gleam/io
import simplifile

pub fn main() {
  let assert Ok(data_day1) = simplifile.read("data/day1.txt")
  io.println("\n--- DAY 1 ---")
  io.println("Part 1 : " <> day1.part1(data_day1) |> int.to_string)
  io.println("Part 2 : " <> day1.part2(data_day1) |> int.to_string)
}
