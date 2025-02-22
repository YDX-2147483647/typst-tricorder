/// U+3000 CJK Symbols and Punctuation IDEOGRAPHIC SPACE
#let SPACE = "\u{3000}"

/// Insert a space for 2-character names.
/// Do nothing for other names
///
/// - name (str):
/// -> str
#let fill-name(name) = {
  // Name without the annotation
  let bare = name.match(regex("^[^（]+")).text

  if bare.clusters().len() == 2 {
    let (a, ..b) = name.clusters()
    (a, SPACE, ..b).join()
  } else {
    name
  }
}

/// Measure the number of cells
///
/// - name (str):
/// -> int
#let measure-width(name) = {
  let len = name
    .clusters()
    // TODO: Hard-coded
    .map(c => if "·，（）".contains(c) {
      1 / 2
    } else { 1 })
    .sum()

  calc.ceil((len + 1) / 4)
}

/// Put blocks before a wall
/// - blocks (array):
/// - wall (int):
/// -> array
#let put-before-wall(blocks, wall) = {
  let result = ()
  // Rest space to the wall
  let rest = wall

  for (width, value) in blocks {
    assert(width <= wall, message: "impossible to place such a long block: " + repr((width, value)))

    if width > rest {
      // Fill the rest space with empty blocks and start a new row
      for _ in array.range(rest) {
        result.push((1, none))
      }
      rest = wall
    }

    // Put a block
    result.push((width, value))
    rest -= width
  }

  result
}

#let tricorder(columns: 0, names) = {
  assert(columns > 0)

  let spans-and-names = names.map(fill-name).map(n => (measure-width(n), n))

  // TODO: Hard-coded
  show "（": it => h(-0.5em) + it
  show regex("[，）]"): it => it + h(-0.5em)

  grid(
    columns: (3em,) * columns,
    gutter: 1em,
    align: start,
    ..put-before-wall(spans-and-names, columns).map(((span, name)) => grid.cell(colspan: span, name))
  )
}
