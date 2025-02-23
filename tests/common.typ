/// Template
///
/// Usage: `#show: project.with(page-width: …)`
#let project(page-width: 0em, body) = {
  assert(page-width != 0em, message: "page width must be set explicitly")

  set page(width: page-width, height: auto, margin: 2em)
  set text(lang: "zh", region: "CN", font: "Source Han Serif SC")

  body
}

/// Fixture for 2010s
/// 《人民日报》2012年11月8日头版右侧主席团名单
/// 图：https://reader.jojokanbao.cn/rmrb/20121108
/// 文：http://www.beijingreview.com.cn/18da/txt/2012-11/08/content_498144.htm
#let renmin-ribao = (
  (
    // …
    "马馼（女）、马凯、马飚（壮族）、马兴瑞、王刚、王侠（女）、王珉、王勇、王晨、王毅、王三运、王万宾、王玉普、王正伟（回族）、王东明",
    // …
    "乌云其木格（女，蒙古族）、尹蔚民、巴特尔（蒙古族）、邓朴方、邓前堆（怒族）、卢展工、田修思、白洁（女）、白立忱（回族）、白玛赤林（藏族）、白志健、白春礼（满族）、令计划、司马义·铁力瓦尔地（维吾尔族）、吉炳轩、回良玉（回族）、朱小丹",
    // …
  )
    .join("、")
    .split("、")
)

/// Fixture for 1910s
/// 《觉醒年代》人物
/// 文：https://movie.douban.com/subject/30228394/celebrities
#let age-of-awakening = "陈独秀、李大钊、陈延年、陈乔年、蔡元培、胡适、鲁迅、周恩来、高君曼、陈鹤年、易群先、柳眉、辜鸿铭、江冬秀、周作人、郭心刚、白兰、邓中夏、赵世炎、毛泽东、顾维钧、赵纫兰、汪大燮、吴炳湘、易白沙、李葆华、葛健豪、张丰载、葛树贵、汪孟邹、董必武、林纾、邵飘萍、杜金銮、陈子美、张国焘、刘一品、傅斯年、刘海威、刘师培、邹永成、王正廷、谢婉莹、李星华、钱能训、徐世昌、袁世凯、柳文耀、何孟雄、刘清扬、范源濂、吴稚晖、夏元瑮、萧子升、刘半农、陈毅、曹汝霖".split("、")

/// Fixture for 2020s
/// 《觉醒年代》演职员
/// 文：https://movie.douban.com/subject/30228394/celebrities
#let age-of-awakening-cast = "张永新、于和伟、张桐、张晚意、马启越、马少骅、朱刚日尧、曹磊、夏德俊、周显欣、杨景天、杨杏、张思乐、毕彦君、武笑羽、卢易、高爽、牟星、张露、岳鹏飞、查文浩、唐旭、林俊毅、侯京健、何政军、刘琳、徐敏、尹铸胜、卫仑、沈琳珺、迟蓬、封新天、侯煜、谭洋、郑昊、舒耀瑄、朱泳腾、王鹏凯、金宁、俞馨妍、牧东、王川、达来哈里呼、姜寒、来喜、张艺文、庞雨浓、王迪、张浩天、黄俊鹏、言杰、韩澈、安冬、张熙唯、黄怀霆、姜瑞霖、商虹、刘文治、臧金生、周舟、李乐、于潼、任学海、李明、蔡尚恒、杨洪武、姿娜、张福正、张风、张佳航、陶陆一然、蒋恺、龙平平、申积军、张光北、李基业、阿鲲、王强、张文杰、韩忠、李菊蓉、高峰".split("、")
