import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub fn part1(data: String) -> Int {
  data
  |> string.split("\n")
  |> list.map(value_of_line)
  |> int.sum
}

pub fn part2(data: String) -> Int {
  data
  |> string.split("\n")
  |> list.map(replace_spelled_out_left)
  |> list.map(string.reverse)
  |> list.map(replace_spelled_out_right)
  |> list.map(string.reverse)
  |> list.map(value_of_line)
  |> int.sum
}

fn replace_spelled_out_left(s: String) -> String {
  case s {
    "one" <> rest -> "1" <> rest
    "two" <> rest -> "2" <> rest
    "three" <> rest -> "3" <> rest
    "four" <> rest -> "4" <> rest
    "five" <> rest -> "5" <> rest
    "six" <> rest -> "6" <> rest
    "seven" <> rest -> "7" <> rest
    "eight" <> rest -> "8" <> rest
    "nine" <> rest -> "9" <> rest
    "" -> ""
    s ->
      s
      |> string.drop_left(1)
      |> replace_spelled_out_left
      |> string.append(string.first(s) |> result.unwrap(""), _)
  }
}

fn replace_spelled_out_right(s: String) -> String {
  case s {
    "eno" <> rest -> "1" <> rest
    "owt" <> rest -> "2" <> rest
    "eerht" <> rest -> "3" <> rest
    "ruof" <> rest -> "4" <> rest
    "evife" <> rest -> "5" <> rest
    "xis" <> rest -> "6" <> rest
    "neves" <> rest -> "7" <> rest
    "thgie" <> rest -> "8" <> rest
    "enin" <> rest -> "9" <> rest
    "" -> ""
    _ ->
      s
      |> string.drop_left(1)
      |> replace_spelled_out_right
      |> string.append(string.first(s) |> result.unwrap(""), _)
  }
}

fn value_of_line(line: String) -> Int {
  let first = line |> string.to_graphemes |> first_number
  let last = line |> string.reverse |> string.to_graphemes |> first_number
  first * 10 + last
}

fn first_number(of s: List(String)) -> Int {
  case s {
    [] -> 0
    [first, ..rest] ->
      case int.base_parse(first, 10) {
        Ok(n) -> n
        Error(_) -> first_number(rest)
      }
  }
}
