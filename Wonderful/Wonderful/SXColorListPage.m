//
//  SXColorListPage.m
//  Wonderful
//
//  Created by dongshangxian on 15/10/30.
//  Copyright © 2015年 Sankuai. All rights reserved.
//

#import "SXColorListPage.h"
#import "SXColorListCell.h"
#import "SXCLE.h"
#import "UIColor+Wonderful.h"
#import "UIColor+Separate.h"
#import <objc/runtime.h>

@interface SXColorListPage ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSMutableArray *marray;

@end

@implementation SXColorListPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getDataSource];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 40;
    
//    [self runTests];
}
//- (void)runTests
//{
//    unsigned int count;
//    Method *methods = class_copyMethodList([UIColor class], &count);
//    for (int i = 0; i < count; i++)
//    {
//        Method method = methods[i];
//        SEL selector = method_getName(method);
//        NSString *name = NSStringFromSelector(selector);
//        NSLog(@"方法名字 ==== %@",name);
//
//    }
//}
- (IBAction)change:(UIBarButtonItem *)sender {
    BOOL result = ![self.tableView isEditing];
    [self.tableView setEditing:result animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.marray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SXCLE *cle = self.marray[indexPath.section][indexPath.row];
    SXColorListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"colorCell"];
    cell.NameLabel.text = cle.desc;
    cell.NumLabel.text = cle.methodName;
    cell.backgroundColor = SXRGB16Color(cle.colorValue);

    return cell;
    
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

//    SXCLE *cle = self.marray[sourceIndexPath.section][sourceIndexPath.row];
//    [self.marray removeObjectAtIndex:sourceIndexPath.row];
//    [self.marray insertObject:cle atIndex:destinationIndexPath.row];
    
    NSMutableArray *temArray = [NSMutableArray array];
    [temArray addObjectsFromArray:self.marray[sourceIndexPath.section]];
    
    SXCLE *cle = temArray[sourceIndexPath.row];
    [temArray removeObjectAtIndex:sourceIndexPath.row];
    [temArray insertObject:cle atIndex:destinationIndexPath.row];
    
    self.marray[sourceIndexPath.section] = temArray;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleArray[section];
}

- (void)getDataSource
{
    self.titleArray = @[@"红",@"黄",@"绿",@"青",@"蓝",@"紫",@"灰",@"白",@"棕",@"粉"];
    
    SXCLE *a1 = [SXCLE CWV:0xFFE4E1 D:@"薄雾玫瑰" N:@"mistyRose"];
    SXCLE *a2 = [SXCLE CWV:0xFFA07A D:@"浅鲑鱼色" N:@"lightSalmon"];
    SXCLE *a3 = [SXCLE CWV:0xF08080 D:@"淡珊瑚色" N:@"lightCoral"];
    SXCLE *a4 = [SXCLE CWV:0xFA8072 D:@"鲑鱼色" N:@"salmonColor"];
    SXCLE *a5 = [SXCLE CWV:0xFF7F50 D:@"珊瑚色" N:@"coralColor"];
    SXCLE *a6 = [SXCLE CWV:0xFF6347 D:@"番茄" N:@"tomatoColor"];
    SXCLE *a7 = [SXCLE CWV:0xFF4500 D:@"橙红色" N:@"orangeRed"];
    SXCLE *a8 = [SXCLE CWV:0xCD5C5C D:@"印度红" N:@"indianRed"];
    SXCLE *a9 = [SXCLE CWV:0xDC143C D:@"猩红" N:@"crimsonColor"];
    SXCLE *a10 = [SXCLE CWV:0xB22222 D:@"耐火砖" N:@"fireBrick"];
    NSArray *array0 = @[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10];
    
    
    SXCLE *b1 = [SXCLE CWV:0xFFF8DC D:@"玉米色" N:@"cornColor"];
    SXCLE *b2 = [SXCLE CWV:0xFFFACD D:@"柠檬薄纱" N:@"LemonChiffon"];
    SXCLE *b3 = [SXCLE CWV:0xEEE8AA D:@"苍金麒麟" N:@"paleGodenrod"];
    SXCLE *b4 = [SXCLE CWV:0xF0E68C D:@"卡其色" N:@"khakiColor"];
    SXCLE *b5 = [SXCLE CWV:0xFFD700 D:@"金色" N:@"goldColor"];
    SXCLE *b6 = [SXCLE CWV:0xFFC64B D:@"雌黄" N:@"orpimentColor"];
    SXCLE *b7 = [SXCLE CWV:0xFFB61E D:@"藤黄" N:@"gambogeColor"];
    SXCLE *b8 = [SXCLE CWV:0xE9BB1D D:@"雄黄" N:@"realgarColor"];
    SXCLE *b9 = [SXCLE CWV:0xDAA520 D:@"金麒麟色" N:@"goldenrod"];
    SXCLE *b10 = [SXCLE CWV:0xA78E44 D:@"乌金" N:@"darkGold"];
    NSArray *array1 = @[b1,b2,b3,b4,b5,b6,b7,b8,b9,b10];
    
    SXCLE *c1 = [SXCLE CWV:0x98FB98 D:@"苍绿" N:@"paleGreen"];
    SXCLE *c2 = [SXCLE CWV:0x90EE90 D:@"淡绿色" N:@"lightGreen"];
    SXCLE *c3 = [SXCLE CWV:0x2AFD84 D:@"春绿" N:@"springGreen"];
    SXCLE *c4 = [SXCLE CWV:0xADFF2F D:@"绿黄色" N:@"greenYellow"];
    SXCLE *c5 = [SXCLE CWV:0x7CFC00 D:@"草坪绿" N:@"lawnGreen"];
    SXCLE *c6 = [SXCLE CWV:0x32CD32 D:@"酸橙绿" N:@"limeGreen"];
    SXCLE *c7 = [SXCLE CWV:0x228B22 D:@"森林绿" N:@"forestGreen"];
    SXCLE *c8 = [SXCLE CWV:0x2E8B57 D:@"海洋绿" N:@"seaGreen"];
    SXCLE *c9 = [SXCLE CWV:0x006400 D:@"深绿" N:@"darkGreen"];
    SXCLE *c10 = [SXCLE CWV:0x556B2F D:@"橄榄(墨绿)" N:@"olive"];

    NSArray *array2 = @[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10];
    
    SXCLE *d1 = [SXCLE CWV:0xE1FFFF D:@"淡青色" N:@"lightCyan"];
    SXCLE *d2 = [SXCLE CWV:0xAFEEEE D:@"苍白绿松石" N:@"paleTurquoise"];
    SXCLE *d3 = [SXCLE CWV:0x7FFFD4 D:@"绿碧" N:@"aquamarine"];
    SXCLE *d4 = [SXCLE CWV:0x40E0D0 D:@"绿松石" N:@"turquoise"];
    SXCLE *d5 = [SXCLE CWV:0x48D1CC D:@"适中绿松石" N:@"mediumTurquoise"];
    SXCLE *d6 = [SXCLE CWV:0x2BB8AA D:@"美团色" N:@"meituanColor"];
    SXCLE *d7 = [SXCLE CWV:0x20B2AA D:@"浅海洋绿" N:@"lightSeaGreen"];
    SXCLE *d8 = [SXCLE CWV:0x008B8B D:@"深青色" N:@"darkCyan"];
    SXCLE *d9 = [SXCLE CWV:0x008080 D:@"水鸭色" N:@"tealColor"];
    SXCLE *d10 = [SXCLE CWV:0x2F4F4F D:@"深石板灰" N:@"darkSlateGray"];
    NSArray *array3 = @[d1,d2,d3,d4,d5,d6,d7,d8,d9,d10];
    
    SXCLE *e1 = [SXCLE CWV:0x8ACEE9 D:@"天蓝色" N:@"skyBlue"];
    SXCLE *e2 = [SXCLE CWV:0x8ACFF8 D:@"淡蓝" N:@"lightBLue"];
    SXCLE *e3 = [SXCLE CWV:0x00BFFF D:@"深天蓝" N:@"deepSkyBlue"];
    SXCLE *e4 = [SXCLE CWV:0x1E90FF D:@"道奇蓝" N:@"doderBlue"];
    SXCLE *e5 = [SXCLE CWV:0x6495ED D:@"矢车菊" N:@"cornflowerBlue"];
    SXCLE *e6 = [SXCLE CWV:0x4169E1 D:@"皇家蓝" N:@"royalBlue"];
    SXCLE *e7 = [SXCLE CWV:0x0000CD D:@"适中的蓝色" N:@"mediumBlue"];
    SXCLE *e8 = [SXCLE CWV:0x00008B D:@"深蓝" N:@"darkBlue"];
    SXCLE *e9 = [SXCLE CWV:0x000080 D:@"海军蓝" N:@"navyColor"];
    SXCLE *e10 = [SXCLE CWV:0x191970 D:@"午夜蓝" N:@"midnightBlue"];
    NSArray *array4 = @[e1,e2,e3,e4,e5,e6,e7,e8,e9,e10];
    
    SXCLE *f0 = [SXCLE CWV:0xE6E6FA D:@"薰衣草" N:@"lavender"];
    SXCLE *f1 = [SXCLE CWV:0xD8BFD8 D:@"蓟" N:@"thistleColor"];
    SXCLE *f2 = [SXCLE CWV:0xDDA0DD D:@"李子" N:@"plumColor"];
    SXCLE *f3 = [SXCLE CWV:0xEE82EE D:@"紫罗兰" N:@"violetColor"];
    SXCLE *f4 = [SXCLE CWV:0xBA55D3 D:@"适中的兰花紫" N:@"mediumOrchid"];
    SXCLE *f5 = [SXCLE CWV:0x9932CC D:@"深兰花紫" N:@"darkOrchid"];
    SXCLE *f6 = [SXCLE CWV:0x9400D3 D:@"深紫罗兰色" N:@"darkVoilet"];
    SXCLE *f7 = [SXCLE CWV:0x8A2BE2 D:@"泛蓝紫罗兰" N:@"blueViolet"];
    SXCLE *f8 = [SXCLE CWV:0x8B008B D:@"深洋红色" N:@"darkMagenta"];
    SXCLE *f9 = [SXCLE CWV:0x4B0082 D:@"靛青" N:@"indigoColor"];
    NSArray *array5 = @[f0,f1,f2,f3,f4,f5,f6,f7,f8,f9];
    
    
    SXCLE *g1 = [SXCLE CWV:0xF5F5F5 D:@"白烟" N:@"whiteSmoke"];
    SXCLE *g2 = [SXCLE CWV:0xE0EEE8 D:@"鸭蛋" N:@"duckEgg"];
    SXCLE *g3 = [SXCLE CWV:0xDCDCDC D:@"亮灰" N:@"gainsboroColor"];
    SXCLE *g4 = [SXCLE CWV:0xBBCDC5 D:@"蟹壳青" N:@"carapaceColor"];
    SXCLE *g5 = [SXCLE CWV:0xC0C0C0 D:@"银白色" N:@"silverColor"];
    SXCLE *g6 = [SXCLE CWV:0x696969 D:@"暗淡的灰色" N:@"dimGray"];
    NSArray *array6 = @[g1,g2,g3,g4,g5,g6];
    
    
    SXCLE *h1 = [SXCLE CWV:0xFFF5EE D:@"海贝壳" N:@"seaShell"];
    SXCLE *h2 = [SXCLE CWV:0xFFFAFA D:@"雪" N:@"snowColor"];
    SXCLE *h3 = [SXCLE CWV:0xFAF0E6 D:@"亚麻色" N:@"linenColor"];
    SXCLE *h4 = [SXCLE CWV:0xFFFAF0 D:@"花之白" N:@"floralWhite"];
    SXCLE *h5 = [SXCLE CWV:0xFDF5E6 D:@"老饰带" N:@"oldLace"];
    SXCLE *h6 = [SXCLE CWV:0xFFFFF0 D:@"象牙白" N:@"ivoryColor"];
    SXCLE *h7 = [SXCLE CWV:0xF0FFF0 D:@"蜂蜜露" N:@"honeydew"];
    SXCLE *h8 = [SXCLE CWV:0xF5FFFA D:@"薄荷奶油" N:@"mintCream"];
    SXCLE *h9 = [SXCLE CWV:0xF0FFFF D:@"蔚蓝色" N:@"azureColor"];
    SXCLE *h10 = [SXCLE CWV:0xF0F8FF D:@"爱丽丝蓝" N:@"aliceBlue"];
    SXCLE *h11 = [SXCLE CWV:0xF8F8FF D:@"幽灵白" N:@"ghostWhite"];
    SXCLE *h12 = [SXCLE CWV:0xFFF0F5 D:@"淡紫红" N:@"lavenderBlush"];
    SXCLE *h13 = [SXCLE CWV:0xF5F5DD D:@"米色" N:@"beigeColor"];
    NSArray *array7 = @[h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13];
    
    
    
    SXCLE *i1 = [SXCLE CWV:0xD2B48C D:@"黄褐色" N:@"tanColor"];
    SXCLE *i2 = [SXCLE CWV:0xBC8F8F D:@"玫瑰棕色" N:@"rosyBrown"];
    SXCLE *i3 = [SXCLE CWV:0xCD853F D:@"秘鲁" N:@"peruColor"];
    SXCLE *i4 = [SXCLE CWV:0xD2691E D:@"巧克力" N:@"chocolateColor"];
    SXCLE *i5 = [SXCLE CWV:0xB87333 D:@"古铜色" N:@"bronzeColor"];
    SXCLE *i6 = [SXCLE CWV:0xA0522D D:@"黄土赭色" N:@"siennaColor"];
    SXCLE *i7 = [SXCLE CWV:0x8B4513 D:@"马鞍棕色" N:@"saddleBrown"];
    SXCLE *i8 = [SXCLE CWV:0x734A12 D:@"土棕" N:@"soilColor"];
    SXCLE *i9 = [SXCLE CWV:0x800000 D:@"栗色" N:@"maroonColor"];
    SXCLE *i10 = [SXCLE CWV:0x5E2612 D:@"乌贼墨棕" N:@"inkfishBrown"];
    NSArray *array8 = @[i1,i2,i3,i4,i5,i6,i7,i8,i9,i10];
    
    SXCLE *j1 = [SXCLE CWV:0xF3D3E7 D:@"水粉" N:@"waterPink"];
    SXCLE *j2 = [SXCLE CWV:0xEDD1D8 D:@"藕色" N:@"lotusRoot"];
    SXCLE *j3 = [SXCLE CWV:0xFFC0CB D:@"浅粉红" N:@"lightPink"];
    SXCLE *j4 = [SXCLE CWV:0xFFB6C1 D:@"适中的粉红" N:@"mediumPink"];
    SXCLE *j5 = [SXCLE CWV:0xF47983 D:@"桃红" N:@"peachRed"];
    SXCLE *j6 = [SXCLE CWV:0xDB7093 D:@"苍白的紫罗兰红色" N:@"paleVioletRed"];
    SXCLE *j7 = [SXCLE CWV:0xFF1493 D:@"深粉色" N:@"deepPink"];
    NSArray *array9 = @[j1,j2,j3,j4,j5,j6,j7];
    
    self.marray = [NSMutableArray array];
    [self.marray addObject:array0];
    [self.marray addObject:array1];
    [self.marray addObject:array2];
    [self.marray addObject:array3];
    [self.marray addObject:array4];
    [self.marray addObject:array5];
    [self.marray addObject:array6];
    [self.marray addObject:array7];
    [self.marray addObject:array8];
    [self.marray addObject:array9];
}

@end
