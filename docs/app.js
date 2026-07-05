const principles = [
  {
    id: "ren-shu",
    standard: "恃势凌人，失于仁恕",
    sourceTitle: "《孟子-离娄下》",
    sourceUrl: "https://ctext.org/mengzi/li-lou-ii/zhs",
    classicalText:
      "孟子曰：爱人者，人恒爱之；敬人者，人恒敬之。有人于此，其待我以横逆，则君子必自反也。",
    keywords: ["老板", "领导", "上级", "下属", "不适应我们", "这里的节奏", "压力也大", "加班", "绩效", "淘汰", "命令", "服从", "别问", "看表现", "末位", "压指标"],
    issue: "把身份、位置或气势当成道理",
    virtue: "仁恕",
    demand: "把问题说具体，把可以相助和改进的路径讲明",
    warning: "权势能令人一时沉默，却不能令人真正信服"
  },
  {
    id: "xin",
    standard: "言而无信，失于诚信",
    sourceTitle: "《论语-为政》",
    sourceUrl: "https://ctext.org/analects/wei-zheng/zhs",
    classicalText: "子曰：人而无信，不知其可也。大车无輗，小车无軏，其何以行之哉？",
    keywords: ["承诺", "答应", "说好", "保证", "失信", "信用", "变卦", "延期", "鸽", "爽约", "临时", "不算", "反悔"],
    issue: "把说定的话轻轻放下",
    virtue: "诚信",
    demand: "说明缘由，给出补救，让受影响的人有重新安排的余地",
    warning: "信用一亏，后面再漂亮的话也会轻了"
  },
  {
    id: "yi-li",
    standard: "以利忘义，失于取舍",
    sourceTitle: "《论语-里仁》",
    sourceUrl: "https://ctext.org/analects/li-ren/zhs",
    classicalText: "子曰：君子喻于义，小人喻于利。子曰：放于利而行，多怨。",
    keywords: ["花钱", "省钱", "赚钱", "收钱", "成本", "利益", "便宜", "划算", "资源", "回报", "收益", "业绩", "指标", "KPI", "价格", "预算", "省事"],
    issue: "只算利害，不问该不该",
    virtue: "义",
    demand: "先把公平、承诺和应承担的责任放回桌面上",
    warning: "眼前省下的成本，可能会变成长久的人心成本"
  },
  {
    id: "zi-xing",
    standard: "推过于人，失于自省",
    sourceTitle: "《论语-卫灵公》",
    sourceUrl: "https://ctext.org/analects/wei-ling-gong/zhs",
    classicalText: "子曰：君子求诸己，小人求诸人。子曰：过而不改，是谓过矣。",
    keywords: ["不是我的问题", "你自己", "责任", "负责", "背锅", "甩锅", "怪别人", "锅甩", "原因", "失误", "我错", "赖你", "别找我"],
    issue: "急着把过错推远",
    virtue: "自省",
    demand: "先厘清事实，再说明自己能补哪里、改哪里",
    warning: "推过或许能保住一时体面，却会失去别人对担当的信任"
  },
  {
    id: "li-jing",
    standard: "出言轻慢，失于礼敬",
    sourceTitle: "《礼记-曲礼上》",
    sourceUrl: "https://ctext.org/liji/qu-li-shang/zhs",
    classicalText: "毋不敬，俨若思，安定辞，安民哉。",
    keywords: ["你不懂", "都不懂", "这么简单", "按我说的", "闭嘴", "别废话", "随便", "低级", "不配", "无语", "蠢", "垃圾", "废物", "滚", "烦死", "有病", "少来"],
    issue: "先伤人的体面，再谈自己的道理",
    virtue: "礼敬",
    demand: "把轻慢的话收住，只论事实和理由",
    warning: "话若没有敬意，再对也难以让人听进去"
  },
  {
    id: "he-er-bu-tong",
    standard: "强求一致，失于和同",
    sourceTitle: "《论语-子路》",
    sourceUrl: "https://ctext.org/analects/zi-lu/zhs",
    classicalText: "子曰：君子和而不同，小人同而不和。",
    keywords: ["必须一样", "都听我的", "统一口径", "别有意见", "反对", "争论", "站队", "阵营", "拉群", "投票", "不同意", "杠"],
    issue: "把不同意见看成冒犯",
    virtue: "和而不同",
    demand: "容许分歧存在，把可验证的事实和共同目标先分清",
    warning: "表面一致不等于真正同心，压下分歧只会把问题推迟"
  },
  {
    id: "shen-yan",
    standard: "言急行缓，失于笃行",
    sourceTitle: "《论语-里仁》",
    sourceUrl: "https://ctext.org/analects/li-ren/zhs",
    classicalText: "子曰：君子欲讷于言，而敏于行。古者言之不出，耻躬之不逮也。",
    keywords: ["马上", "立刻", "现在就", "喊话", "承认", "表态", "口号", "说说", "画饼", "尽快", "马上处理", "别解释"],
    issue: "急着要话，却不看行动能否跟上",
    virtue: "慎言笃行",
    demand: "少一些逼迫表态，多一些可执行的步骤和时间",
    warning: "话说得太满，行动跟不上，反而更伤信任"
  },
  {
    id: "yi-le",
    standard: "耽于逸乐，失于勤慎",
    sourceTitle: "《论语-学而》",
    sourceUrl: "https://ctext.org/analects/xue-er/zhs",
    classicalText: "子曰：君子食无求饱，居无求安，敏于事而慎于言。",
    keywords: ["去玩", "出去玩", "出来玩", "一起玩", "娱乐", "唱歌", "KTV", "酒吧", "喝酒", "蹦迪", "打游戏", "开黑", "追剧", "刷视频", "打牌", "麻将", "摸鱼", "放松一下", "聚会", "逛街", "夜宵"],
    issue: "把一时玩乐放在应当用心的事情之前",
    virtue: "勤慎",
    demand: "先问正事是否安顿，再谈娱乐是否合宜",
    warning: "逸乐可以调剂身心，却不能替人担起该担的事"
  },
  {
    id: "quan-xue",
    standard: "讥人勤学，失于劝勉",
    sourceTitle: "《荀子-劝学》",
    sourceUrl: "https://ctext.org/xunzi/quan-xue/zhs",
    classicalText: "君子曰：学不可以已。青，取之于蓝，而青于蓝；冰，水为之，而寒于水。",
    keywords: ["你这么努力", "这么努力", "那么努力", "努力有什么用", "努力给谁看", "装努力", "装勤奋", "假努力", "装上进", "假上进", "卷王", "别卷", "这么卷", "卷什么", "那么拼", "这么拼", "学这么多", "读这么多", "看这么多书", "考这么多", "鸡血"],
    issue: "把别人的勤学上进说成可笑之事",
    virtue: "劝学",
    demand: "尊重别人愿意自修向上的心",
    warning: "勤学不是作态，讥笑勤学才显出心志浅薄"
  },
  {
    id: "ming-bian",
    standard: "未审先断，失于明辨",
    sourceTitle: "《中庸》",
    sourceUrl: "https://ctext.org/liji/zhong-yong/zhs",
    classicalText: "博学之，审问之，慎思之，明辨之，笃行之。",
    keywords: ["听说", "据说", "可能", "大概", "好像", "肯定是真的", "一定是", "证据", "确认真假", "核实", "真假", "截图", "传言", "爆料", "谁说的"],
    issue: "证据未明，判断已先出口",
    virtue: "审慎明辨",
    demand: "先问来源、证据和上下文，再决定怎样回应",
    warning: "未审先断，容易把误会说成定论"
  },
  {
    id: "zhong-zheng",
    standard: "审慎回应，未宜遽断",
    sourceTitle: "《中庸》",
    sourceUrl: "https://ctext.org/liji/zhong-yong/zhs",
    classicalText: "喜怒哀乐之未发，谓之中；发而皆中节，谓之和。",
    keywords: [],
    issue: "在信息不足时急着下定论",
    virtue: "中正",
    demand: "先确认事实和关系分寸，再选择温和而清楚的回应",
    warning: "不轻易加罪于人，也不轻易失去自己的立场"
  },
  {
    id: "cha-yan",
    standard: "随众毁誉，失于察言",
    sourceTitle: "《论语-卫灵公》",
    sourceUrl: "https://ctext.org/analects/wei-ling-gong/zhs",
    classicalText: "子曰：众恶之，必察焉；众好之，必察焉。",
    keywords: ["大家都说", "所有人", "没人喜欢", "都讨厌", "风评", "评价", "背后", "八卦", "群里", "吐槽", "人品", "名声"],
    issue: "把众人的声音直接当成事实",
    virtue: "察言观实",
    demand: "把传言、评价和可核验的事情分开",
    warning: "人言可以参考，却不能替代查证"
  },
  {
    id: "ke-zhi",
    standard: "逞忿伤事，失于克制",
    sourceTitle: "《论语-卫灵公》",
    sourceUrl: "https://ctext.org/analects/wei-ling-gong/zhs",
    classicalText: "子曰：巧言乱德，小不忍则乱大谋。",
    keywords: ["气死", "忍不了", "算了", "拉黑", "绝交", "吵", "骂", "怼", "爆发", "烦", "崩溃", "受够", "不想理", "撕"],
    issue: "让一时情绪替整件事做主",
    virtue: "克制",
    demand: "先把情绪和要解决的事分开，留下可回旋的话",
    warning: "一时痛快，常会损掉本来还能转圜的余地"
  },
  {
    id: "qiu-zhi",
    standard: "不懂装懂，失于求实",
    sourceTitle: "《论语-为政》",
    sourceUrl: "https://ctext.org/analects/wei-zheng/zhs",
    classicalText: "子曰：由，诲女知之乎！知之为知之，不知为不知，是知也。",
    keywords: ["不知道", "不懂", "不会", "搞不清", "教程", "帮我", "怎么做", "为什么", "请教", "解释", "学习", "资料", "方案"],
    issue: "把不确定的事说成确定",
    virtue: "求实",
    demand: "承认未知，补足信息，再给出清楚步骤",
    warning: "不知道并不可耻，装作知道才会把小问题拖大"
  },
  {
    id: "shu-dao",
    standard: "强人所难，失于恕道",
    sourceTitle: "《论语-卫灵公》",
    sourceUrl: "https://ctext.org/analects/wei-ling-gong/zhs",
    classicalText: "子贡问曰：有一言而可以终身行之者乎？子曰：其恕乎！己所不欲，勿施于人。",
    keywords: ["必须帮", "你就帮", "借我", "转给我", "替我", "麻烦你", "顺手", "不就", "拒绝", "没空", "边界", "隐私", "权限", "方便一下"],
    issue: "把自己的方便放在别人的难处之前",
    virtue: "恕道",
    demand: "先问对方是否方便，也尊重对方拒绝的余地",
    warning: "不给别人留余地，关系便会先被消耗"
  },
  {
    id: "gai-guo",
    standard: "知过不改，失于补过",
    sourceTitle: "《论语-卫灵公》",
    sourceUrl: "https://ctext.org/analects/wei-ling-gong/zhs",
    classicalText: "子曰：过而不改，是谓过矣。",
    keywords: ["抱歉", "对不起", "不好意思", "算我错", "下次", "补偿", "修复", "改", "再说", "没办法", "已经这样", "算了吧"],
    issue: "把道歉停在口头",
    virtue: "改过补过",
    demand: "把歉意落到补救、复盘和下一次的做法上",
    warning: "错本可改，不改才会让错变成品行上的亏欠"
  },
  {
    id: "jian-xian",
    standard: "嫉贤轻善，失于取法",
    sourceTitle: "《论语-里仁》",
    sourceUrl: "https://ctext.org/analects/li-ren/zhs",
    classicalText: "子曰：见贤思齐焉，见不贤而内自省也。",
    keywords: ["凭什么", "他也就", "她也就", "不就是", "嫉妒", "羡慕", "优秀", "厉害", "表扬", "奖励", "升职", "机会", "偏心"],
    issue: "看见别人的长处，先急着贬低",
    virtue: "见贤思齐",
    demand: "把不服气转成可学习、可比较、可改进的地方",
    warning: "轻善不能显出自己，只会遮住本可进步的路"
  },
  {
    id: "zhong-shu",
    standard: "只顾自己，失于忠恕",
    sourceTitle: "《论语-里仁》",
    sourceUrl: "https://ctext.org/analects/li-ren/zhs",
    classicalText: "曾子曰：夫子之道，忠恕而已矣。",
    keywords: ["我不管", "跟我没关系", "你看着办", "自己想办法", "别影响我", "只要我方便", "无所谓", "懒得管"],
    issue: "只守自己的方便，不顾旁人的处境",
    virtue: "忠恕",
    demand: "把自己的真实难处说清，也替对方留一条可走的路",
    warning: "人情不是单方面的索取，也不是单方面的甩开"
  }
];

const samples = [
  "你可能不太适应我们这里的节奏，最近压力也大，先看这个月表现吧。",
  "之前答应你的时间可能不算了，我这边安排变了，你自己再想办法。",
  "大家都在群里说他人品不行，我觉得肯定是真的。",
  "我现在真的气死了，想直接拉黑他，之后也别解释了。",
  "这个方案我不太懂，但客户问起来你先说我们肯定能做。"
];

const toneProfiles = {
  measured: {
    opening: "我曾听说",
    judgment: "这段话里最需要辨明的，不只是措辞，而是其中的取舍：",
    bridge: "事情当然可以商量，也可以有难处；只是",
    closeLead: "所以更稳妥的说法，是",
    closeTail: "把道理说清，也把人的体面留住。"
  },
  sharp: {
    opening: "古人早把这个关节说透了",
    judgment: "这里的问题并不小：",
    bridge: "若只图一时省力或痛快，",
    closeLead: "真要把话说正，就该",
    closeTail: "否则话越强，理越薄。"
  },
  gentle: {
    opening: "我想起古人的一句提醒",
    judgment: "这段话未必不能谈，但要先照见其中一处偏差：",
    bridge: "人和人相处，难处常有；只是",
    closeLead: "不妨把话放缓些，",
    closeTail: "让事情还有继续变好的余地。"
  }
};

const macStyleReasons = {
  "ren-shu":
    "爱护和尊重别人，别人才愿意以爱敬相回；身居其位的人若只会把本可商量的话说成压人的话，亏的是成全人的仁恕",
  xin:
    "事情可以有难处，计划也可以更改，但说定的话若不说明缘由、不给补救，便是让别人独自承受后果，信用也就轻了",
  "yi-li":
    "利益并非不能谈，成本也并非不能算，只是凡事若只问合不合算而不问公不公平，眼前像得了便宜，长久却会失去信服",
  "zi-xing":
    "一件事出了差池，当然可以分清缘由，但开口便把责任推到别人身上，只求自己片叶不沾，便不是明辨是非，而是少了担当",
  "li-jing":
    "话可以说得直，却不应说得轻慢；意见可以不同，却不该先伤人的体面，因为礼不是虚文，是让道理能被人听进去的门径",
  "he-er-bu-tong":
    "人与人意见不同，本该把事实和目标分清，而不是把分歧看成冒犯；表面一致不等于同心，强压下去只会留下更深的不服",
  "shen-yan":
    "话说出口容易，行动跟上才难；若只急着逼人表态，却不给可实行的步骤和余地，话越满，信任反而越薄",
  "yi-le":
    "娱乐不是不可有，放松也不是罪过，只是正事未定、心志未收时便急着邀人玩乐，便是把一时快意放在应尽之事前头",
  "quan-xue":
    "学问与修身本就不可停，肯下功夫的人是在替自己蓄力；拿别人的勤勉来阴阳取笑，笑不掉别人的进益，只显出自己不知劝学",
  "ming-bian":
    "传闻和判断之间，还隔着来源、证据和上下文；若未审先断，便容易把误会说成定论，把可以查清的事说坏",
  "zhong-zheng":
    "话到口边，先把事实和分寸想清楚，不轻易责人，也不轻易失了自己的立场",
  "cha-yan":
    "众人喜欢或厌恶，都只能作参考，不能直接当成事实；把传言、评价和可核验的事情分开，才不至于随声附和而伤人",
  "ke-zhi":
    "一时气愤最容易替整件事做主，可话若说绝、事若做绝，痛快只在片刻，损掉的却是本来还能转圜的余地",
  "qiu-zhi":
    "知道就是知道，不知道就是不知道；承认未知并不可耻，装作确定才会把小问题拖成大亏欠",
  "shu-dao":
    "自己觉得顺手的事，未必对别人也轻省；先问对方是否方便，也尊重对方拒绝的余地，才是不把自己的方便压到别人身上",
  "gai-guo":
    "道歉若只停在口头，过失仍旧留在那里；把歉意落到补救、复盘和下一次的做法上，错才有被改过来的可能",
  "jian-xian":
    "看见别人的长处，先急着贬低，并不能显出自己；把不服气转成可学习、可改进的地方，才是真正有益的取法",
  "zhong-shu":
    "人情不是单方面的索取，也不是单方面的甩开；说清自己的难处，也替对方留一条可走的路，关系才不至于被方便二字耗尽"
};

const contextInput = document.querySelector("#contextInput");
const inputMeta = document.querySelector("#inputMeta");
const standardText = document.querySelector("#standardText");
const sourceText = document.querySelector("#sourceText");
const classicalText = document.querySelector("#classicalText");
const replyText = document.querySelector("#replyText");
const toast = document.querySelector("#toast");
const modeButtons = [...document.querySelectorAll(".mode-button")];

let activeTone = "measured";
let sampleIndex = 1;

function normalizeText(text) {
  return text.toLowerCase().replace(/\s+/g, "");
}

function scorePrinciple(principle, context) {
  const normalized = normalizeText(context);
  let score = 0;

  principle.keywords.forEach((keyword) => {
    if (normalized.includes(normalizeText(keyword))) {
      score += keyword.length >= 3 ? 4 : 3;
    }
  });

  if (/!|！/.test(context) && ["ke-zhi", "li-jing", "ren-shu"].includes(principle.id)) score += 1;
  if (/\?|？/.test(context) && principle.id === "ming-bian") score += 2;
  if (/\?|？/.test(context) && /怎么|为什么|请教|教程|资料|方案|如何/.test(context) && principle.id === "qiu-zhi") score += 2;
  if (/我|自己|我的/.test(context) && /你|别人|对方|他们|大家/.test(context) && ["shu-dao", "zhong-shu", "zi-xing"].includes(principle.id)) score += 1;
  if (/别|不要|不许|必须|立刻|马上/.test(context) && ["shu-dao", "shen-yan"].includes(principle.id)) score += 1;
  if (/老板|领导|上级|主管|经理|下属/.test(context) && /必须|安排|压力|服从|绩效|淘汰|加班|表现/.test(context) && principle.id === "ren-shu") score += 3;
  if (/去|来|出来|一起|今晚|周末|下班/.test(context) && /玩|娱乐|唱歌|KTV|酒吧|喝酒|蹦迪|游戏|开黑|追剧|打牌|麻将|夜宵/.test(context) && principle.id === "yi-le") score += 3;
  if (/努力|勤奋|学习|读书|看书|自律|上进|备考|复习|拼|卷/.test(context) && /有什么用|给谁看|装|假|卷王|别卷|卷什么|至于吗|笑死|鸡血/.test(context) && principle.id === "quan-xue") score += 5;

  return score;
}

function bestPrinciple(context) {
  const scored = principles
    .map((principle) => ({ principle, score: scorePrinciple(principle, context) }))
    .sort((left, right) => {
      if (right.score !== left.score) return right.score - left.score;
      return right.principle.keywords.length - left.principle.keywords.length;
    });

  if (!context.trim()) {
    return { principle: principles.find((principle) => principle.id === "zhong-zheng"), score: 0 };
  }

  if (scored[0].score < 3) {
    return { principle: principles.find((principle) => principle.id === "zhong-zheng"), score: 0 };
  }

  return scored[0];
}

function contextDigest(context) {
  const cleaned = context
    .replace(/\s+/g, " ")
    .replace(/[“”"']/g, "")
    .trim();

  if (!cleaned) return "眼前这段话";

  const clauses = cleaned
    .split(/[。！？!?；;，,\n]/)
    .map((part) => part.trim())
    .filter(Boolean)
    .sort((left, right) => right.length - left.length);

  const candidate = clauses[0] || cleaned;
  return candidate.length > 34 ? `${candidate.slice(0, 34)}...` : candidate;
}

function readableScore(score) {
  if (score >= 8) return "强匹配";
  if (score >= 4) return "中匹配";
  if (score > 0) return "弱匹配";
  return "兜底明辨";
}

function trimSentence(text) {
  return text.replace(/[。！？!?；;，,\s]+$/g, "");
}

function plainReasonFor(principle, score) {
  return trimSentence(macStyleReasons[principle.id] || `${principle.demand}，${principle.warning}`);
}

function buildReply(context, principle, score) {
  const reason = plainReasonFor(principle, score);
  return `我曾听说，${reason}。这样的道理，您还是好好想想吧。`;
}

function generate() {
  const context = contextInput.value.trim();
  const { principle, score } = bestPrinciple(context);
  const wordCount = context.length;

  standardText.textContent = principle.standard;
  sourceText.textContent = principle.sourceTitle;
  classicalText.textContent = principle.classicalText;
  replyText.value = buildReply(context, principle, score);
  inputMeta.textContent =
    wordCount > 0
      ? `${wordCount} 字，${readableScore(score)}：${principle.sourceTitle}`
      : "未输入内容，当前展示通用审慎回应。";
}

function showToast(message) {
  toast.textContent = message;
  toast.classList.add("is-visible");
  window.clearTimeout(showToast.timer);
  showToast.timer = window.setTimeout(() => toast.classList.remove("is-visible"), 1400);
}

function setTone(tone) {
  activeTone = tone;
  modeButtons.forEach((button) => {
    button.classList.toggle("is-active", button.dataset.tone === tone);
  });
  generate();
}

document.querySelector("#generateButton").addEventListener("click", generate);

document.querySelector("#clearButton").addEventListener("click", () => {
  contextInput.value = "";
  contextInput.focus();
  generate();
});

document.querySelector("#sampleButton").addEventListener("click", () => {
  contextInput.value = samples[sampleIndex % samples.length];
  sampleIndex += 1;
  generate();
});

contextInput.addEventListener("input", generate);

modeButtons.forEach((button) => {
  button.addEventListener("click", () => setTone(button.dataset.tone));
});

document.querySelectorAll(".copy-button").forEach((button) => {
  button.addEventListener("click", async () => {
    const target = document.querySelector(`#${button.dataset.copyTarget}`);
    const text = "value" in target ? target.value : target.textContent;

    try {
      await navigator.clipboard.writeText(text.trim());
      showToast("已复制");
    } catch {
      showToast("复制失败，请手动选择文本");
    }
  });
});

contextInput.value = samples[0];
generate();
