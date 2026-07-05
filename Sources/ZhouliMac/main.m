#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>
#import <ApplicationServices/ApplicationServices.h>

@interface ZhouliResult : NSObject
@property (nonatomic, copy) NSString *standard;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *classicalText;
@property (nonatomic, copy) NSString *reply;
@end

@implementation ZhouliResult
@end

@interface ZhouliGenerator : NSObject
- (ZhouliResult *)generateFromContext:(NSString *)context;
@end

@implementation ZhouliGenerator

- (ZhouliResult *)generateFromContext:(NSString *)context {
    NSString *input = [self normalizedContext:context];
    NSDictionary *best = [self bestPassageForContext:input];

    ZhouliResult *result = [ZhouliResult new];
    result.standard = best[@"standard"];
    result.source = best[@"source"];
    result.classicalText = best[@"classical"];
    result.reply = [self replyForContext:input passage:best];
    return result;
}

- (NSArray<NSDictionary *> *)passages {
    return @[
        @{
            @"standard": @"诱人嬉游，失于勤勉",
            @"virtue": @"勤勉",
            @"source": @"《进学解》",
            @"keywords": @[@"去玩", @"出来玩", @"别学了", @"别卷了", @"娱乐", @"放松一下", @"出去嗨", @"喝酒", @"酒吧", @"KTV", @"打游戏", @"游戏", @"刷剧", @"看电影", @"摸鱼", @"躺平", @"聚会"],
            @"classical": @"业精于勤，荒于嬉；行成于思，毁于随。",
            @"meaning": @"学业和本事往往因勤勉而精进，也会因嬉戏放纵而荒废；人的行事因深思而成，也会因随波逐流而败坏。",
            @"advice": @"娱乐可以有度，但不该拿一时玩乐去消磨一个人正在积累的志气。"
        },
        @{
            @"standard": @"讥人勤学，失于劝勉",
            @"virtue": @"劝学",
            @"source": @"《荀子-劝学》",
            @"keywords": @[@"努力", @"学习", @"读书", @"这么拼", @"真拼", @"卷", @"内卷", @"卷王", @"假努力", @"装努力", @"有用吗", @"学吧", @"奋斗", @"上进", @"勤奋", @"自律", @"用功", @"考试"],
            @"classical": @"君子曰：学不可以已。锲而不舍，金石可镂。",
            @"meaning": @"学习和努力本就不该轻易停止，只要能持久不舍，即使坚硬如金石，也终有被刻穿的时候。",
            @"advice": @"旁人讥笑勤勉，多半只是看见了眼前的辛苦，却看不见日后的积累。"
        },
        @{
            @"standard": @"恃势凌人，失于仁恕",
            @"virtue": @"仁恕",
            @"source": @"《孟子-离娄下》",
            @"keywords": @[@"老板", @"领导", @"上级", @"下属", @"节奏", @"适应", @"压力", @"绩效", @"淘汰", @"服从", @"管理", @"加班", @"汇报", @"职场"],
            @"classical": @"孟子曰：爱人者，人恒爱之；敬人者，人恒敬之。",
            @"meaning": @"有身份和权力的人，更应以爱人、敬人的方式成全别人，而不是借位置压人。",
            @"advice": @"若真觉得对方一时不合节奏，应当说明标准、给出路径、提供扶助，而不是用含混的话把人推到不安之中。"
        },
        @{
            @"standard": @"言而无信，失于诚信",
            @"virtue": @"诚信",
            @"source": @"《论语-为政》",
            @"keywords": @[@"承诺", @"答应", @"说好", @"变卦", @"信用", @"失信", @"保证", @"延期", @"反悔", @"约定", @"鸽", @"放鸽子"],
            @"classical": @"子曰：人而无信，不知其可也。大车无輗，小车无軏，其何以行之哉？",
            @"meaning": @"人若没有信用，就像车失去关键连接，再漂亮也难以前行。",
            @"advice": @"事情可以更改，但应讲清缘由、补上安排；若只让别人承担改口的后果，便会损伤彼此信任。"
        },
        @{
            @"standard": @"以利忘义，失于取舍",
            @"virtue": @"义利之辨",
            @"source": @"《论语-里仁》",
            @"keywords": @[@"钱", @"成本", @"利益", @"便宜", @"划算", @"资源", @"回报", @"收益", @"预算", @"性价比", @"亏", @"赚"],
            @"classical": @"子曰：君子喻于义，小人喻于利。",
            @"meaning": @"利益可以衡量，却不能越过是非；只懂得利，就容易忘了该不该。",
            @"advice": @"可以谈条件，也可以算成本，但先要问是否公平、是否合宜，否则所得再多，也会折损人心。"
        },
        @{
            @"standard": @"推过于人，失于自省",
            @"virtue": @"自省",
            @"source": @"《论语-卫灵公》",
            @"keywords": @[@"不是我的问题", @"你自己", @"责任", @"背锅", @"怪", @"甩锅", @"原因", @"失误", @"错误", @"谁负责", @"锅"],
            @"classical": @"子曰：君子求诸己，小人求诸人。",
            @"meaning": @"君子遇事先反求诸己，小人遇事只向别人身上找过错。",
            @"advice": @"分清事实当然必要，但若开口便推责，就会把解决问题变成互相防备。"
        },
        @{
            @"standard": @"出言轻慢，失于礼敬",
            @"virtue": @"礼敬",
            @"source": @"《礼记-曲礼上》",
            @"keywords": @[@"你不懂", @"随便", @"闭嘴", @"别废话", @"简单", @"低级", @"不配", @"无语", @"蠢", @"垃圾", @"废物", @"傻"],
            @"classical": @"毋不敬，俨若思，安定辞，安民哉。",
            @"meaning": @"言辞安定而不轻躁，才是让人愿意听道理的门径。",
            @"advice": @"话可以直说，却不应轻慢；意见可以相左，却不该先伤人的体面。"
        },
        @{
            @"standard": @"急于责备，失于宽厚",
            @"virtue": @"宽厚",
            @"source": @"《论语-子张》",
            @"keywords": @[@"责怪", @"批评", @"怎么又", @"为什么总", @"受不了", @"忍不了", @"差劲", @"不行", @"失望", @"骂"],
            @"classical": @"子贡曰：君子之过也，如日月之食焉；过也，人皆见之；更也，人皆仰之。",
            @"meaning": @"人有过失并不可怕，可贵的是给人改正的余地，也让改过被看见。",
            @"advice": @"若只把过错钉在别人身上，便断了改进的路；若指出问题也指出方法，才是成全。"
        },
        @{
            @"standard": @"只求胜人，失于和而不同",
            @"virtue": @"和而不同",
            @"source": @"《论语-子路》",
            @"keywords": @[@"争", @"吵", @"赢", @"输", @"必须听我的", @"不同意", @"反对", @"杠", @"辩", @"观点"],
            @"classical": @"子曰：君子和而不同，小人同而不和。",
            @"meaning": @"真正的和，不是逼所有人同声，而是在不同意见中仍保有相互尊重。",
            @"advice": @"争论可以辨明道理，但若只想压倒对方，就会让道理变成胜负。"
        },
        @{
            @"standard": @"苛求于人，失于恕道",
            @"virtue": @"恕道",
            @"source": @"《论语-卫灵公》",
            @"keywords": @[@"必须", @"立刻", @"马上", @"不接受", @"没借口", @"标准", @"要求", @"完美", @"应该", @"凭什么"],
            @"classical": @"子贡问曰：有一言而可以终身行之者乎？子曰：其恕乎！己所不欲，勿施于人。",
            @"meaning": @"自己不愿承受的逼迫，不应轻易加到别人身上。",
            @"advice": @"要求可以清楚，边界也可以坚定，但要留出人能解释、能修正、能喘息的余地。"
        },
        @{
            @"standard": @"见小失大，失于远虑",
            @"virtue": @"远虑",
            @"source": @"《论语-卫灵公》",
            @"keywords": @[@"现在", @"马上", @"短期", @"先这样", @"以后再说", @"无所谓", @"小事", @"凑合", @"暂时"],
            @"classical": @"子曰：人无远虑，必有近忧。",
            @"meaning": @"只图眼前省事，后来往往要为眼前的轻忽付出代价。",
            @"advice": @"眼下可以权衡轻重，但不能把该想清楚的后果都推给以后。"
        },
        @{
            @"standard": @"听言不察，失于明辨",
            @"virtue": @"明辨",
            @"source": @"《论语-颜渊》",
            @"keywords": @[@"听说", @"别人说", @"都说", @"据说", @"传", @"谣", @"怀疑", @"肯定是", @"绝对", @"一定"],
            @"classical": @"子曰：君子不以言举人，不以人废言。",
            @"meaning": @"不能只凭话说得好就信其人，也不能因不喜欢某人就废弃他的道理。",
            @"advice": @"若没有查明事实，话就应当留有余地；判断越重，证据越要清楚。"
        },
        @{
            @"standard": @"情绪凌人，失于中和",
            @"virtue": @"中和",
            @"source": @"《中庸》",
            @"keywords": @[@"生气", @"烦", @"崩溃", @"受够", @"火大", @"讨厌", @"恶心", @"不爽", @"情绪", @"冷静"],
            @"classical": @"喜怒哀乐之未发，谓之中；发而皆中节，谓之和。",
            @"meaning": @"情绪并非不可有，关键在于发出来时是否合乎分寸。",
            @"advice": @"可以表达不满，却不宜让怒气替自己说话；越在激动时，越要守住话的边界。"
        },
        @{
            @"standard": @"不肯改过，失于修身",
            @"virtue": @"改过",
            @"source": @"《论语-学而》",
            @"keywords": @[@"改不了", @"就这样", @"习惯了", @"别管", @"无所谓", @"不用改", @"我没错", @"一直都这样"],
            @"classical": @"过则勿惮改。",
            @"meaning": @"有过失并不可耻，明知有过却怕改、拒改，才会使小过变成大失。",
            @"advice": @"若事情确有不妥，与其急着辩解，不如先把能修正的地方修正。"
        },
        @{
            @"standard": @"只论亲疏，失于公正",
            @"virtue": @"公正",
            @"source": @"《礼记-礼运》",
            @"keywords": @[@"自己人", @"关系", @"熟人", @"偏心", @"照顾", @"站队", @"人情", @"亲戚", @"朋友", @"帮我"],
            @"classical": @"大道之行也，天下为公。",
            @"meaning": @"公道不是只照顾亲近的人，而是让事情按应有的是非行走。",
            @"advice": @"情分可以珍惜，但不能替代公理；若只看亲疏，旁人便难以信服。"
        },
        @{
            @"standard": @"不教而诛，失于教化",
            @"virtue": @"教化",
            @"source": @"《论语-尧曰》",
            @"keywords": @[@"处罚", @"惩罚", @"扣", @"开除", @"拉黑", @"封", @"罚", @"警告", @"处分", @"一次机会"],
            @"classical": @"不教而杀谓之虐；不戒视成谓之暴。",
            @"meaning": @"没有先教导、先提醒，就直接重罚，是失了教化的次序。",
            @"advice": @"若要追究后果，也应先让规则明白、提醒到位；否则惩处越重，越显得不仁。"
        },
        @{
            @"standard": @"好恶失衡，失于知人",
            @"virtue": @"知人",
            @"source": @"《论语-卫灵公》",
            @"keywords": @[@"喜欢", @"讨厌", @"看不惯", @"偏见", @"印象", @"一直觉得", @"人品", @"标签", @"评价"],
            @"classical": @"众恶之，必察焉；众好之，必察焉。",
            @"meaning": @"众人都厌恶或都称赞一个人，也仍要亲自审察，不能被好恶带走。",
            @"advice": @"评价一个人时，最好落到具体事实；若只凭印象和情绪，就容易伤人而不自知。"
        },
        @{
            @"standard": @"多言伤实，失于慎言",
            @"virtue": @"慎言",
            @"source": @"《道德经》",
            @"keywords": @[@"解释一下", @"说清楚", @"废话", @"长篇", @"保证", @"随口", @"开玩笑", @"吐槽", @"嘴快"],
            @"classical": @"多言数穷，不如守中。",
            @"meaning": @"话说得太满太急，常常反而露出穷尽；守住分寸，才有余地。",
            @"advice": @"可以说明，却不必逞一时口快；话留三分，事便多三分转圜。"
        },
        @{
            @"standard": @"强人所难，失于成人之美",
            @"virtue": @"成人之美",
            @"source": @"《论语-颜渊》",
            @"keywords": @[@"帮个忙", @"就一下", @"顺手", @"不难", @"为我", @"配合", @"迁就", @"牺牲", @"拜托", @"应该帮"],
            @"classical": @"子曰：君子成人之美，不成人之恶。",
            @"meaning": @"君子帮助人成就好的事，而不是逼人配合自己的难处。",
            @"advice": @"请求帮助时，应让对方有选择和拒绝的余地；若把自己的方便建立在别人的为难上，就失了美意。"
        },
        @{
            @"standard": @"自矜自是，失于谦德",
            @"virtue": @"谦德",
            @"source": @"《尚书-大禹谟》",
            @"keywords": @[@"我最", @"只有我", @"你懂什么", @"当然", @"肯定", @"不用你说", @"我早就", @"水平", @"资格"],
            @"classical": @"满招损，谦受益。",
            @"meaning": @"自满容易招来损失，谦虚反而能使人受益。",
            @"advice": @"一个人有见识，也不必把话说满；肯给别人留下余地，自己的道理反而更容易立住。"
        }
    ];
}

- (NSDictionary *)bestPassageForContext:(NSString *)context {
    NSArray<NSDictionary *> *passages = [self passages];
    NSDictionary *best = passages.firstObject;
    NSInteger bestScore = NSIntegerMin;
    NSInteger bestKeywordScore = 0;

    for (NSDictionary *passage in passages) {
        NSInteger keywordScore = 0;
        for (NSString *keyword in passage[@"keywords"]) {
            if ([context rangeOfString:keyword options:NSCaseInsensitiveSearch].location != NSNotFound) {
                keywordScore += 3;
            }
        }
        NSInteger score = keywordScore;
        score += [self punctuationScoreForContext:context];
        if ([context length] < 8) {
            score -= 1;
        }
        if (score > bestScore) {
            bestScore = score;
            bestKeywordScore = keywordScore;
            best = passage;
        }
    }
    if (bestKeywordScore == 0 && passages.count > 0) {
        best = passages[[context hash] % passages.count];
    }
    return best;
}

- (NSInteger)punctuationScoreForContext:(NSString *)context {
    NSInteger score = 0;
    if ([context containsString:@"！"] || [context containsString:@"!"]) {
        score += 1;
    }
    if ([context containsString:@"？"] || [context containsString:@"?"]) {
        score += 1;
    }
    return score;
}

- (NSString *)normalizedContext:(NSString *)context {
    NSString *input = context ?: @"";
    NSString *trimmed = [input stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (trimmed.length == 0) {
        return @"对方没有留下足够清楚的话语，但交谈仍需守礼、明义、存恕。";
    }
    if (trimmed.length > 180) {
        return [[trimmed substringToIndex:180] stringByAppendingString:@"..."];
    }
    return trimmed;
}

- (NSString *)replyForContext:(NSString *)context passage:(NSDictionary *)passage {
    return [NSString stringWithFormat:@"我曾听说，%@这样的道理，您还是好好想想吧。", passage[@"meaning"]];
}

@end

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>
@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong) NSPanel *panel;
@property (nonatomic, strong) NSTextField *appLabel;
@property (nonatomic, strong) NSTextView *contextView;
@property (nonatomic, strong) NSTextField *standardLabel;
@property (nonatomic, strong) NSTextField *sourceLabel;
@property (nonatomic, strong) NSTextView *classicalView;
@property (nonatomic, strong) NSTextView *replyView;
@property (nonatomic, strong) ZhouliGenerator *generator;
@property (nonatomic, strong) NSRunningApplication *targetApplication;
@property (nonatomic, strong) NSRunningApplication *lastNonSelfApplication;
@property (nonatomic) EventHotKeyRef hotKeyRef;
@property (nonatomic) EventHandlerRef eventHandlerRef;
@end

static OSStatus HotKeyHandler(EventHandlerCallRef nextHandler, EventRef event, void *userData) {
    AppDelegate *delegate = (__bridge AppDelegate *)userData;
    [delegate performSelectorOnMainThread:@selector(activateAssistant) withObject:nil waitUntilDone:NO];
    return noErr;
}

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    self.generator = [ZhouliGenerator new];
    [self configureStatusItem];
    [self configurePanel];
    [self requestAccessibilityPermissionIfNeeded];
    [self registerHotKey];
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                           selector:@selector(activeApplicationDidChange:)
                                                               name:NSWorkspaceDidActivateApplicationNotification
                                                             object:nil];
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    [[[NSWorkspace sharedWorkspace] notificationCenter] removeObserver:self];
    if (self.hotKeyRef) {
        UnregisterEventHotKey(self.hotKeyRef);
    }
    if (self.eventHandlerRef) {
        RemoveEventHandler(self.eventHandlerRef);
    }
}

- (void)configureStatusItem {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.button.title = @"周礼";
    self.statusItem.button.toolTip = @"周礼生成器 - 按 Option + Space 唤醒";

    NSMenu *menu = [NSMenu new];
    [menu addItem:[[NSMenuItem alloc] initWithTitle:@"唤醒周礼生成器" action:@selector(activateAssistant) keyEquivalent:@" "]];
    [menu addItem:[NSMenuItem separatorItem]];
    [menu addItem:[[NSMenuItem alloc] initWithTitle:@"退出" action:@selector(terminate:) keyEquivalent:@"q"]];
    self.statusItem.menu = menu;
}

- (void)activeApplicationDidChange:(NSNotification *)notification {
    NSRunningApplication *application = notification.userInfo[NSWorkspaceApplicationKey];
    if (application && ![self isOwnApplication:application]) {
        self.lastNonSelfApplication = application;
    }
}

- (BOOL)isOwnApplication:(NSRunningApplication *)application {
    NSString *ownBundleIdentifier = NSBundle.mainBundle.bundleIdentifier;
    NSString *appBundleIdentifier = application.bundleIdentifier;
    if (ownBundleIdentifier.length > 0 && appBundleIdentifier.length > 0) {
        return [ownBundleIdentifier isEqualToString:appBundleIdentifier];
    }
    return application.processIdentifier == NSProcessInfo.processInfo.processIdentifier;
}

- (void)configurePanel {
    self.panel = [[NSPanel alloc] initWithContentRect:NSMakeRect(0, 0, 760, 680)
                                           styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskFullSizeContentView
                                             backing:NSBackingStoreBuffered
                                               defer:NO];
    self.panel.title = @"周礼生成器";
    self.panel.floatingPanel = YES;
    self.panel.level = NSFloatingWindowLevel;
    self.panel.collectionBehavior = NSWindowCollectionBehaviorCanJoinAllSpaces | NSWindowCollectionBehaviorFullScreenAuxiliary;
    self.panel.releasedWhenClosed = NO;
    self.panel.delegate = self;

    NSView *content = self.panel.contentView;
    content.wantsLayer = YES;
    content.layer.backgroundColor = NSColor.windowBackgroundColor.CGColor;

    NSStackView *root = [NSStackView stackViewWithViews:@[]];
    root.orientation = NSUserInterfaceLayoutOrientationVertical;
    root.spacing = 12;
    root.edgeInsets = NSEdgeInsetsMake(18, 18, 18, 18);
    root.translatesAutoresizingMaskIntoConstraints = NO;
    [content addSubview:root];

    [NSLayoutConstraint activateConstraints:@[
        [root.leadingAnchor constraintEqualToAnchor:content.leadingAnchor],
        [root.trailingAnchor constraintEqualToAnchor:content.trailingAnchor],
        [root.topAnchor constraintEqualToAnchor:content.topAnchor],
        [root.bottomAnchor constraintEqualToAnchor:content.bottomAnchor]
    ]];

    NSTextField *title = [self label:@"周礼生成器" size:22 weight:NSFontWeightSemibold color:NSColor.labelColor];
    self.appLabel = [self label:@"来自：当前应用" size:13 weight:NSFontWeightRegular color:NSColor.secondaryLabelColor];
    self.contextView = [self textViewEditable:YES];
    self.standardLabel = [self label:@"判断：" size:13 weight:NSFontWeightMedium color:NSColor.labelColor];
    self.sourceLabel = [self label:@"古文依据：" size:13 weight:NSFontWeightMedium color:NSColor.labelColor];
    self.classicalView = [self textViewEditable:NO];
    self.replyView = [self textViewEditable:YES];

    [root addArrangedSubview:title];
    [root addArrangedSubview:self.appLabel];
    [root addArrangedSubview:[self label:@"聊天上下文" size:13 weight:NSFontWeightMedium color:NSColor.labelColor]];
    [root addArrangedSubview:[self scrollViewForTextView:self.contextView height:120]];
    [root addArrangedSubview:self.standardLabel];
    [root addArrangedSubview:self.sourceLabel];
    [root addArrangedSubview:[self scrollViewForTextView:self.classicalView height:110]];
    [root addArrangedSubview:[self label:@"生成回复" size:13 weight:NSFontWeightMedium color:NSColor.labelColor]];
    [root addArrangedSubview:[self scrollViewForTextView:self.replyView height:220]];

    NSStackView *buttons = [NSStackView stackViewWithViews:@[]];
    buttons.orientation = NSUserInterfaceLayoutOrientationHorizontal;
    buttons.spacing = 10;

    NSButton *close = [NSButton buttonWithTitle:@"关闭" target:self action:@selector(closePanel)];
    NSButton *regenerate = [NSButton buttonWithTitle:@"重新生成" target:self action:@selector(regenerate)];
    NSButton *insert = [NSButton buttonWithTitle:@"插入聊天框" target:self action:@selector(insertReply)];
    insert.keyEquivalent = @"\r";
    NSView *spacer = [NSView new];
    [spacer setContentHuggingPriority:NSLayoutPriorityDefaultLow forOrientation:NSLayoutConstraintOrientationHorizontal];

    [buttons addArrangedSubview:close];
    [buttons addArrangedSubview:spacer];
    [buttons addArrangedSubview:regenerate];
    [buttons addArrangedSubview:insert];
    [root addArrangedSubview:buttons];
}

- (NSTextField *)label:(NSString *)text size:(CGFloat)size weight:(NSFontWeight)weight color:(NSColor *)color {
    NSTextField *label = [NSTextField labelWithString:text];
    label.font = [NSFont systemFontOfSize:size weight:weight];
    label.textColor = color;
    return label;
}

- (NSTextView *)textViewEditable:(BOOL)editable {
    NSTextView *textView = [NSTextView new];
    textView.editable = editable;
    textView.richText = NO;
    textView.font = [NSFont systemFontOfSize:14];
    textView.drawsBackground = YES;
    textView.backgroundColor = NSColor.whiteColor;
    textView.textColor = NSColor.blackColor;
    textView.insertionPointColor = NSColor.blackColor;
    textView.usesFontPanel = NO;
    textView.usesRuler = NO;
    textView.importsGraphics = NO;
    textView.allowsUndo = editable;
    textView.verticallyResizable = YES;
    textView.horizontallyResizable = NO;
    textView.autoresizingMask = NSViewWidthSizable;
    textView.minSize = NSMakeSize(0, 0);
    textView.maxSize = NSMakeSize(CGFLOAT_MAX, CGFLOAT_MAX);
    textView.textContainer.containerSize = NSMakeSize(CGFLOAT_MAX, CGFLOAT_MAX);
    textView.textContainer.widthTracksTextView = YES;
    textView.selectedTextAttributes = @{
        NSBackgroundColorAttributeName: NSColor.selectedTextBackgroundColor,
        NSForegroundColorAttributeName: NSColor.whiteColor
    };
    textView.typingAttributes = @{
        NSFontAttributeName: [NSFont systemFontOfSize:14],
        NSForegroundColorAttributeName: NSColor.blackColor,
        NSBackgroundColorAttributeName: NSColor.whiteColor
    };
    textView.textContainerInset = NSMakeSize(8, 8);
    return textView;
}

- (NSScrollView *)scrollViewForTextView:(NSTextView *)textView height:(CGFloat)height {
    NSScrollView *scroll = [NSScrollView new];
    scroll.borderType = NSBezelBorder;
    scroll.hasVerticalScroller = YES;
    scroll.drawsBackground = YES;
    scroll.backgroundColor = NSColor.whiteColor;
    textView.frame = NSMakeRect(0, 0, 640, height);
    scroll.documentView = textView;
    scroll.translatesAutoresizingMaskIntoConstraints = NO;
    [scroll.heightAnchor constraintEqualToConstant:height].active = YES;
    return scroll;
}

- (void)setPlainText:(NSString *)text inTextView:(NSTextView *)textView {
    NSString *value = text ?: @"";
    NSDictionary *attributes = @{
        NSFontAttributeName: [NSFont systemFontOfSize:14],
        NSForegroundColorAttributeName: NSColor.blackColor,
        NSBackgroundColorAttributeName: NSColor.whiteColor
    };

    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:value attributes:attributes];
    [textView.textStorage setAttributedString:attributed];
    textView.typingAttributes = attributes;
    textView.textColor = NSColor.blackColor;
    textView.backgroundColor = NSColor.whiteColor;
    [textView setNeedsDisplay:YES];
}

- (void)requestAccessibilityPermissionIfNeeded {
    NSDictionary *options = @{(__bridge NSString *)kAXTrustedCheckOptionPrompt: @YES};
    AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options);
}

- (void)registerHotKey {
    EventTypeSpec eventType = {kEventClassKeyboard, kEventHotKeyPressed};
    InstallApplicationEventHandler(&HotKeyHandler, 1, &eventType, (__bridge void *)self, &_eventHandlerRef);

    EventHotKeyID hotKeyID = {'ZLHG', 1};
    RegisterEventHotKey(kVK_Space, optionKey, hotKeyID, GetApplicationEventTarget(), 0, &_hotKeyRef);
}

- (void)activateAssistant {
    NSRunningApplication *frontmostApplication = NSWorkspace.sharedWorkspace.frontmostApplication;
    if (frontmostApplication && ![self isOwnApplication:frontmostApplication]) {
        self.targetApplication = frontmostApplication;
        self.lastNonSelfApplication = frontmostApplication;
    } else {
        self.targetApplication = self.lastNonSelfApplication;
    }

    NSString *appName = self.targetApplication.localizedName ?: @"当前应用";

    [self captureSelectedTextFromTargetApplication:^(NSString *context) {
        self.appLabel.stringValue = [NSString stringWithFormat:@"来自：%@", appName];
        self.standardLabel.stringValue = @"判断：";
        self.sourceLabel.stringValue = @"古文依据：";

        if (context.length == 0) {
            NSString *permissionText = AXIsProcessTrusted() ? @"已开启" : @"未开启";
            NSString *message = [NSString stringWithFormat:@"没有读到选中文本。\n\n当前目标应用：%@\n辅助功能权限：%@\n\n请确认：1. 微信中选中的文字手动按 Command + C 可以复制；2. 系统设置 -> 隐私与安全性 -> 辅助功能 已允许周礼生成器；3. 退出旧的周礼进程后重新 make run。",
                                 appName,
                                 permissionText];
            [self setPlainText:message inTextView:self.contextView];
        } else {
            [self setPlainText:context inTextView:self.contextView];
        }

        [self setPlainText:@"" inTextView:self.classicalView];
        [self setPlainText:@"正在生成..." inTextView:self.replyView];
        [self generateForCurrentContext];
        [self showPanel];
        [NSApp activateIgnoringOtherApps:YES];
    }];
}

- (void)showPanel {
    NSScreen *screen = NSScreen.mainScreen;
    if (screen) {
        NSRect frame = screen.visibleFrame;
        NSSize size = self.panel.frame.size;
        [self.panel setFrameOrigin:NSMakePoint(NSMidX(frame) - size.width / 2, NSMidY(frame) - size.height / 2)];
    }
    [self.panel makeKeyAndOrderFront:nil];
}

- (void)captureSelectedTextFromTargetApplication:(void (^)(NSString *context))completion {
    NSString *accessibilityText = [self selectedTextFromAccessibilityForApplication:self.targetApplication];
    NSString *trimmedAccessibilityText = [accessibilityText stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (trimmedAccessibilityText.length > 0) {
        completion(accessibilityText);
        return;
    }

    NSPasteboard *pasteboard = NSPasteboard.generalPasteboard;
    NSString *previous = [pasteboard stringForType:NSPasteboardTypeString];
    NSString *sentinel = [NSString stringWithFormat:@"__ZHOU_LI_COPY_SENTINEL_%@__", NSUUID.UUID.UUIDString];

    [self attemptCopySelectedTextWithSentinel:sentinel previousClipboard:previous remainingAttempts:3 completion:completion];
}

- (void)attemptCopySelectedTextWithSentinel:(NSString *)sentinel
                          previousClipboard:(NSString *)previous
                          remainingAttempts:(NSInteger)remainingAttempts
                                 completion:(void (^)(NSString *context))completion {
    NSPasteboard *pasteboard = NSPasteboard.generalPasteboard;
    [pasteboard clearContents];
    [pasteboard setString:sentinel forType:NSPasteboardTypeString];

    if (self.targetApplication) {
        [self.targetApplication activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.22 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self sendCommandShortcutWithKeyCode:8];
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.72 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *captured = [pasteboard stringForType:NSPasteboardTypeString] ?: @"";
        if ([captured isEqualToString:sentinel]) {
            captured = @"";
        }

        NSString *trimmed = [captured stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        if (trimmed.length > 0) {
            [self restoreClipboard:previous fallbackCapturedText:captured];
            completion(captured);
            return;
        }

        if (remainingAttempts > 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.18 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self attemptCopySelectedTextWithSentinel:sentinel
                                        previousClipboard:previous
                                        remainingAttempts:remainingAttempts - 1
                                               completion:completion];
            });
            return;
        }

        [self restoreClipboard:previous fallbackCapturedText:captured];
        completion(@"");
    });
}

- (void)restoreClipboard:(NSString *)previous fallbackCapturedText:(NSString *)captured {
    NSPasteboard *pasteboard = NSPasteboard.generalPasteboard;
    [pasteboard clearContents];
    if (previous.length > 0) {
        [pasteboard setString:previous forType:NSPasteboardTypeString];
    } else if (captured.length > 0) {
        [pasteboard setString:captured forType:NSPasteboardTypeString];
    }
}

- (NSString *)selectedTextFromAccessibilityForApplication:(NSRunningApplication *)application {
    if (!application) {
        return @"";
    }

    AXUIElementRef appElement = AXUIElementCreateApplication(application.processIdentifier);
    if (!appElement) {
        return @"";
    }

    CFTypeRef focusedValue = NULL;
    AXError focusedError = AXUIElementCopyAttributeValue(appElement, kAXFocusedUIElementAttribute, &focusedValue);
    CFRelease(appElement);
    if (focusedError != kAXErrorSuccess || !focusedValue) {
        return @"";
    }

    AXUIElementRef focusedElement = (AXUIElementRef)focusedValue;
    CFTypeRef selectedValue = NULL;
    AXError selectedError = AXUIElementCopyAttributeValue(focusedElement, kAXSelectedTextAttribute, &selectedValue);
    CFRelease(focusedElement);
    if (selectedError != kAXErrorSuccess || !selectedValue) {
        return @"";
    }

    NSString *selectedText = @"";
    if (CFGetTypeID(selectedValue) == CFStringGetTypeID()) {
        selectedText = [(__bridge NSString *)selectedValue copy];
    }
    CFRelease(selectedValue);
    return selectedText ?: @"";
}

- (void)generateForCurrentContext {
    ZhouliResult *result = [self.generator generateFromContext:self.contextView.string];
    self.standardLabel.stringValue = [NSString stringWithFormat:@"判断：%@", result.standard];
    self.sourceLabel.stringValue = [NSString stringWithFormat:@"古文依据：%@", result.source];
    [self setPlainText:result.classicalText inTextView:self.classicalView];
    [self setPlainText:result.reply inTextView:self.replyView];
}

- (void)regenerate {
    [self generateForCurrentContext];
}

- (void)insertReply {
    NSString *reply = self.replyView.string ?: @"";
    if (reply.length == 0) {
        return;
    }

    NSPasteboard *pasteboard = NSPasteboard.generalPasteboard;
    NSString *previous = [pasteboard stringForType:NSPasteboardTypeString];
    [pasteboard clearContents];
    [pasteboard setString:reply forType:NSPasteboardTypeString];

    [self.panel orderOut:nil];
    [self.targetApplication activateWithOptions:NSApplicationActivateIgnoringOtherApps];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.22 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self sendCommandShortcutWithKeyCode:9];

        if (previous) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [pasteboard clearContents];
                [pasteboard setString:previous forType:NSPasteboardTypeString];
            });
        }
    });
}

- (void)sendCommandShortcutWithKeyCode:(CGKeyCode)keyCode {
    CGEventSourceRef source = CGEventSourceCreate(kCGEventSourceStateHIDSystemState);
    if (!source) {
        return;
    }

    CGEventRef keyDown = CGEventCreateKeyboardEvent(source, keyCode, true);
    CGEventRef keyUp = CGEventCreateKeyboardEvent(source, keyCode, false);
    CGEventSetFlags(keyDown, kCGEventFlagMaskCommand);
    CGEventSetFlags(keyUp, kCGEventFlagMaskCommand);
    CGEventPost(kCGHIDEventTap, keyDown);
    CGEventPost(kCGHIDEventTap, keyUp);

    CFRelease(keyDown);
    CFRelease(keyUp);
    CFRelease(source);
}

- (void)closePanel {
    [self.panel orderOut:nil];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication *app = NSApplication.sharedApplication;
        AppDelegate *delegate = [AppDelegate new];
        app.delegate = delegate;
        [app setActivationPolicy:NSApplicationActivationPolicyAccessory];
        [app run];
    }
    return 0;
}
