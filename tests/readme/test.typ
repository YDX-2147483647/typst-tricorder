//《现代汉语词典》第7版所印试印本审定委员会

#import "/tests/common.typ": project
#import "/src/lib.typ": tricorder

#show: project.with(page-width: 19em)

#tricorder(
  .."丁声树、黎锦熙、李荣、陆志韦、陆宗达、吕叔湘、石明远、王力、魏建功、叶籁士、叶圣陶、周定一、周浩然、周祖谟、朱文叔".split("、"),
  "成吉思汗（蒙古族，古人）", "张大三", "李小四",
)

#set page(width: 20em)
#let names = "丁声树、黎锦熙、李荣、陆志韦、陆宗达、吕叔湘".split("、")
#tricorder(columns: auto, ..names)

#align(
  center,
  tricorder(columns: 3, ..names),
)

#show: project.with(page-width: auto)
#show raw: set text(font: "Source Han Serif SC")
#set table(stroke: none, align: start + horizon)
#set raw(lang: "typc")

#let null = "孔乙己"
#show "孔乙己": set text(gray)

#figure(
  table(
    columns: 2,
    table.hline(),
    table.header[*例子 Example*][*结果 Result*],
    table.hline(stroke: 0.5pt),
    table.hline(stroke: 0.5pt),
    `"张飞"`, tricorder("张飞", null, null),
    `[张飞]`, tricorder([张飞], null, null),
    `((span: 2), "张飞")`, tricorder(((span: 2), "张飞"), null),
    `((span: 2), "张\u{3000}　飞")`, tricorder(((span: 2), "张\u{3000}　飞"), null),
    table.hline(stroke: 0.5pt),
    `"Spock"`, tricorder("Spock", null),
    `[Spock]`, tricorder([Spock], null, null),
    `((span: 1), "Spock")`, tricorder(((span: 1), "Spock"), null, null),
    `((span: 2), "Lt. Spock")`, tricorder(((span: 2), "Lt. Spock"), null),
    table.hline(stroke: 0.5pt),
    `"冉·阿让"`, tricorder("冉·阿让", null),
    `highlight[冉·阿让]`, tricorder(highlight[冉·阿让], null, null),
    `((overflow: true), highlight[冉·阿让])`, tricorder(((overflow: true), highlight[冉·阿让]), null, null),
    table.hline(stroke: 0.5pt),
    `"曹先擢（主任）"`, tricorder("曹先擢（主任）", null),
    ```
    (
      (overflow: true),
      [曹先擢]
        + sub(
          box(
            scale(x: 50%, reflow: true)[
              （主任）
            ],
          ),
        ),
    ),
    ```,
    tricorder(
      (
        (overflow: true),
        [曹先擢]
          + sub(
            box(
              scale(x: 50%, reflow: true)[
                （主任）
              ],
            ),
          ),
      ),
      null,
      null,
    ),
    table.hline(),
  ),
)
