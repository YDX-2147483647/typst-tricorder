//《现代汉语词典》第7版所印各版本审定委员会和编纂、修订工作人员

#import "/tests/common.typ": project
#import "/src/lib.typ": tricorder

#show: project.with(page-width: 19em)

#show heading.where(level: 1): set align(center)
#show heading.where(level: 1): set text(1.25em)

#show heading.where(level: 2): it => {
  set line(length: 100%, stroke: (dash: "dotted"))
  grid(
    columns: (1fr, auto, 1fr),
    gutter: 0.5em,
    align: horizon,
    line(), it, line(),
  )
}
#show heading.where(level: 2): pad.with(bottom: 0.5em, top: 1em)

/// Annotation after a heading
#let annotation(level: 0, body) = {
  assert(level == 1 or level == 2)

  if level == 2 {
    v(-0.5em) // Eat pad(bottom: 0.5em, heading(…))
  }

  align(center, text(0.8em, body))
}


// https://ano-via.github.io/dict/images/0008.jpg
= 审订委员会
#annotation(level: 1)[（按姓氏音序排列）]

== 试印本

#tricorder(
  .."丁声树、黎锦熙、李荣、陆志韦、陆宗达、吕叔湘、石明远、王力、魏建功、叶籁士、叶圣陶、周定一、周浩然、周祖谟、朱文叔".split("、"),
)

== 第5版

#tricorder(
  ((overflow: true), [曹先擢#sub(box(scale(x: 50%, reflow: true)[（主任）]))]),
  .."晁继周、陈原、董琨、韩敬体、胡明扬、江蓝生、刘庆隆、陆俭明、陆尊梧、沈家煊、苏培成、王宁、徐枢、周明鉴".split("、"),
)

== 第6版

#table(
  columns: (auto, 1fr),
  stroke: none,
  column-gutter: 0.5em,
  row-gutter: 0.25em,
  inset: (x: 0em),
  [*顾　问：*], tricorder("曹先擢", "胡明扬"),
  [*委　员：*],
  tricorder(
    .."蔡文兰、晁继周、程荣、董琨、韩敬体、江蓝生、陆俭明、沈家煊、苏宝荣、苏培成、谭景春、王宁、张博、张志毅、周明鉴".split("、"),
  ),
)

#show: project.with(page-width: 27em)

// https://ano-via.github.io/dict/images/0009.jpg
= 编纂、修订工作人员

#set align(center)
#show strong: set text(4em / 3)
#show emph: set text(0.8em)

#let prelude(..rows) = {
  assert(rows.named().len() == 0)

  let rows = rows.pos()
  let n = "主要□□人员".clusters().len()

  set text(0.8em)

  rows
    .map(r => if r.contains("：") {
      let (k, v) = r.split("：")

      assert(k.clusters().len() == 2)
      assert(v.clusters().len() == 3)

      block(
        width: (n + 1) * 1em,
        text(tracking: 1em / n, k) + h(1fr) + strong(v),
      )
    } else {
      par(text(tracking: 1em / (n - 1), r))
    })
    .join()
}

== 1960年试印本
#annotation(level: 2)[（1956–1960）]

#prelude(
  "主编：吕叔湘",
  "主要编纂人员",
)

#tricorder(
  columns: 6,
  .."孙德宣、孙崇义、何梅岑、李伯纯、萧家霖、孔凡均、王述达、刘庆隆、郭地、李文生、刘洁修、莫衡、吴崇康、李国炎、郑宣沐、单耀海、吕天琛、徐萧斧、范继淹、范方莲、傅婧、姜远、王立达".split("、"),
)

_资料人员_

#tricorder(.."徐世禄、贺澹江、高泽均、王焕贞、赵桂钧、王蕴明、姚宝田".split("、"))

== 1965年试用本
#annotation(level: 2)[（1961–1965）]

#prelude(
  "主编：丁声树",
  "协助：李　荣",
  "主要修订人员",
)

#tricorder(
  .."孙德宣、何梅岑、李伯纯、刘庆隆、莫衡、吴崇康、李国炎、单耀海、吕天琛、吴昌恒、陆卓元、曲翰章、刘洁修、舒宝璋、金有景、闵家骥、韩敬体、李玉英、张聿忠、夏义民".split("、"),
)

_资料人员_

#tricorder(.."徐世禄、王焕贞、岳珺玲、宋惠德、于庆芝".split("、"))

== 1978年第1版
#annotation(level: 2)[（1973–1978）]

#prelude(
  "主编：丁声树",
  "主要修订人员",
)

#tricorder(
  columns: 6,
  .."闵家骥、刘庆隆、孙德宣、韩敬体、李国炎、吕天琛、李伯纯、莫衡、吴昌恒、吴崇康、陆卓元、曲翰章、刘洁修、李玉英、张聿忠、单耀海、周定一、管燮初、邵荥芬、王克仲、麦梅翘、白宛如、黄雪贞、金有景、曹剑芬、刘连元、陈嘉猷、柳凤运、夏义民".split("、"),
)

_资料人员_

#tricorder(.."宋惠德、岳珺玲、于庆芝、王焕贞、陈梦华".split("、"))

#pagebreak()

// https://ano-via.github.io/dict/images/0010.jpg

== 1996年修订版（第3版）
#annotation(level: 2)[（1993–1996）]

_修订审计_
#v(-0.5em)
*单耀海 韩敬体*

_主要修订人员_

#tricorder(
  .."晁继周、吴昌恒、吴崇康、董琨、李志江、刘庆隆、李国炎、莫衡、吕天琛、陆尊梧、曹兰萍、贾采珠、黄华".split("、"),
)

_计算机处理和资料人员_

#tricorder(.."王伟、宋惠德、郭小妹、张彤、张林".split("、"))

== 2005年修订版（第5版）
#annotation(level: 2)[（1999–2005）]

_修订主持人_
#v(-0.5em)
*晁继周 韩敬体*

_参加修订的人员#text(0.8em)[（按姓氏音序排列）]_

#tricorder(
  columns: 5,
  .."曹兰萍、贾采珠、李志江、刘庆隆、陆尊梧、吕京、谭景春、王楠、王伟".split("、"),
)

_参加部分修订的人员#text(0.8em)[（按姓氏音序排列）]_

#tricorder(
  columns: 5,
  .."程荣、杜翔、黄华、孟庆海、潘雪莲、曲翰章、王克仲、王霞、张铁文、赵大明".split("、"),
)

#grid(
  columns: (1fr,) * 2,
  row-gutter: 1em,
  [_资料人员_] + h(1em) + box(tricorder("郭小妹", "王清利")),
  [_词类标注审订负责人_] + h(1em) + box(tricorder("徐枢")),
  [_哲社条目审订负责人_] + h(1em) + box(tricorder("董琨")),
  [_科技条目审订负责人_] + h(1em) + box(tricorder("周明鉴")),
)

== 2012年修订版（第6版）
#annotation(level: 2)[（2008–2012）]

_修订主持人_
#v(-0.5em)
*江蓝生 谭景春 程荣*

_参加修订的人员_

#tricorder(
  .."韩敬体、晁继周、董琨、赵大明、李志江、贾采珠、郭小武、王楠、王伟、杜翔、张铁文、王霞、曹兰萍、吕京".split("、"),
)

_参加部分修订的人员_

#tricorder(.."蔡文兰、陆尊梧、徐枢、黄雪贞、王海棻、王克仲、潘雪莲、侯瑞芬、张定".split("、"))

_资料人员_

#tricorder("郭小妹", "王清利")
