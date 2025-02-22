#import "/src/lib.typ": tricorder

#set page(width: auto, height: auto, margin: 2em)
#set text(lang: "zh", region: "CN", font: "Source Han Serif SC")

// 《人民日报》2012年11月8日头版右侧主席团名单
// 图：https://reader.jojokanbao.cn/rmrb/20121108
// 文：http://www.beijingreview.com.cn/18da/txt/2012-11/08/content_498144.htm
#let names = (
  // …
  "马馼（女）",
  "马凯",
  "马飚（壮族）",
  "马兴瑞",
  "王刚",
  "王侠（女）",
  "王珉",
  "王勇",
  "王晨",
  "王毅",
  "王三运",
  "王万宾",
  "王玉普",
  "王正伟（回族）",
  "王东明",
  // …
  "乌云其木格（女，蒙古族）",
  "尹蔚民",
  "巴特尔（蒙古族）",
  "邓朴方",
  "邓前堆（怒族）",
  "卢展工",
  "田修思",
  "白洁（女）",
  "白立忱（回族）",
  "白玛赤林（藏族）",
  "白志健",
  "白春礼（满族）",
  "令计划",
  "司马义·铁力瓦尔地（维吾尔族）",
  "吉炳轩",
  "回良玉（回族）",
  "朱小丹",
  // …
)

#tricorder(columns: 4, names)
