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

/// Measure the number of cells that will be occupied by the `name`
///
/// - name (str):
/// - column-gutter (length):
/// -> span (int):
/// -> overflow (bool):
#let measure-span(name, column-gutter) = {
  let len = name
    .clusters()
    // TODO: Hard-coded
    .map(c => if "·，（）".contains(c) {
      0.5em
    } else { 1em })
    .sum()

  let span = calc.ceil((len + column-gutter - 1em) / (3em + column-gutter))
  (
    span: span,
    overflow: span != calc.ceil((len + column-gutter) / (3em + column-gutter)),
  )
}

/// Put blocks before a wall
/// - blocks (array): A list of ((span, overflow), content)
/// - wall (int): Number of available cells in each row
/// -> array
#let put-before-wall(blocks, wall) = {
  let result = ()
  // Rest space to the wall
  let rest = wall

  for ((span, overflow), value) in blocks {
    assert(
      span + int(overflow) <= wall,
      message: "impossible to place such a long block: (span: "
        + repr(span)
        + ", overflow: "
        + repr(overflow)
        + ", "
        + repr(value)
        + ")",
    )

    if span + int(overflow) > rest {
      // Fill the rest space with empty blocks
      if rest > 0 { result.push(((rest, false), none)) }
      // Start a new row
      rest = wall
    }

    // Put a block
    result.push(((span, overflow), value))
    rest -= span
  }

  result
}

#let tricorder(columns: auto, column-gutter: 1em, row-gutter: 1em, ..names) = {
  assert(names.named().len() == 0)
  let names = names.pos()
  assert(columns == auto or (type(columns) == int and columns > 0))

  let spans-and-names = names.map(fill-name).map(n => (measure-span(n, column-gutter), n))

  // TODO: Hard-coded
  show "（": it => h(-0.5em) + it
  show regex("[，）]"): it => it + h(-0.5em)

  if columns == auto {
    // Auto columns
    block({
      set par(leading: row-gutter)

      // The whole block can be arbitrarily aligned,
      // but its last line is always aligned left.
      set align(start)

      spans-and-names
        .map((((span, overflow), name)) => (
          // If not overflow, write `name` and a weak gutter.
          // Otherwise, write `name` and the gutter into a single box.
          box(
            width: (3em + column-gutter) * span - if not overflow { column-gutter } else { 0em },
            name,
          ),
          if not overflow { h(column-gutter, weak: true) } else { none },
        ))
        .flatten()
        .join()
    })
  } else {
    // Fixed columns
    grid(
      columns: (3em,) * columns,
      column-gutter: column-gutter,
      row-gutter: row-gutter,
      align: start,
      ..put-before-wall(spans-and-names, columns).map((((span, overflow), name)) => grid.cell(
        colspan: span,
        inset: if overflow { (right: -column-gutter) } else { (:) },
        name,
      ))
    )
  }
}
