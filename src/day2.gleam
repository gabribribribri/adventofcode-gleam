import gleam/int
import gleam/list
import gleam/result
import gleam/string

type Cube {
  Red(Int)
  Green(Int)
  Blue(Int)
}

const maximum_red = 12

const maximum_green = 13

const maximum_blue = 14

pub fn part1(data: String) -> Int {
  data
  |> string.split("\n")
  |> list.map(eval_line_value)
  |> int.sum
}

pub fn part2(data: String) -> Int {
  data
  |> string.split("\n")
  |> list.map(eval_line_power)
  |> int.sum
}

fn line_to_cubes(line: String) -> List(Cube) {
  line
  |> string.crop(":")
  |> string.drop_left(1)
  |> string.split(";")
  |> list.map(string.split(_, ","))
  |> list.flatten
  |> list.filter(string_isnt_empty)
  |> list.map(string.trim)
  |> list.map(subset_to_cube)
}

fn eval_line_power(line: String) -> Int {
  let line_power = line |> line_to_cubes |> eval_cubes_power
  line_power.0 * line_power.1 * line_power.2
}

fn eval_cubes_power(cubes: List(Cube)) -> #(Int, Int, Int) {
  case cubes {
    [first, ..rest] ->
      case first {
        Red(n) -> {
          let rest_power = eval_cubes_power(rest)
          #(int.max(n, rest_power.0), rest_power.1, rest_power.2)
        }
        Green(n) -> {
          let rest_power = eval_cubes_power(rest)
          #(rest_power.0, int.max(rest_power.1, n), rest_power.2)
        }
        Blue(n) -> {
          let rest_power = eval_cubes_power(rest)
          #(rest_power.0, rest_power.1, int.max(rest_power.2, n))
        }
      }
    [] -> #(0, 0, 0)
  }
}

fn eval_line_value(line: String) -> Int {
  let game_id = line |> string.drop_left(5) |> eval_game_id(0)
  case line |> line_to_cubes |> list.all(cube_check) {
    True -> game_id
    False -> 0
  }
}

fn string_isnt_empty(s) -> Bool {
  !string.is_empty(s)
}

fn cube_check(c: Cube) -> Bool {
  case c {
    Red(n) if n <= maximum_red -> True
    Green(n) if n <= maximum_green -> True
    Blue(n) if n <= maximum_blue -> True
    _ -> False
  }
}

fn subset_to_cube(s: String) -> Cube {
  let assert [snum, color] = s |> string.split(" ")
  let num = snum |> int.parse |> result.unwrap(0)
  case color {
    "red" -> Red(num)
    "green" -> Green(num)
    "blue" -> Blue(num)
    _ -> panic
  }
}

fn eval_game_id(line: String, start_with: Int) -> Int {
  case line |> string.first {
    Ok(c) ->
      case c |> int.parse {
        Ok(n) -> eval_game_id(line |> string.drop_left(1), start_with * 10 + n)
        Error(_) -> start_with
      }
    Error(_) -> start_with
  }
}
