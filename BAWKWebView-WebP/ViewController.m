//
//  ViewController.m
//  BAWKWebView-WebP
//
//  Created by 海洋唐 on 2017/8/2.
//  Copyright © 2017年 boai. All rights reserved.
//

/*!
 *  获取屏幕宽度和高度
 */
#define BAKit_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define BAKit_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#import "ViewController.h"
#import "BAWebpController.h"

static NSString * const kURL0 = @"https://pano.autohome.com.cn/car/ext/47248?_ahrotate=1&clicktype=1&noshare=1&appversion=10.21.5&pagesrc=series_img&ipadtile=1&color=000000&appversion=10.21.5&mwidth=414&mheight=896";
static NSString * const kURL1 = @"https://vr.yiche.com/vr/PanoInnerNew.html?c=a&albumId=4884&app_ver=10.53.0&time=2019101201&btnCenterY=64";
static NSString * const kURL2 = @"https://h5.mvmtv.com/2020-09-27/f488ebe1-4d54-a5cb-a38d-0d3097458999.html";
static NSString * const kURL3 = @"https://isparta.github.io/compare-webp/index_a.html#12";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *baTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationItem.title = @"WKWebP";
    [self.view addSubview:self.baTableView];
}

- (NSArray<NSDictionary *> *)dataArray {
    if (!_dataArray) {
        _dataArray = @[ @{@"title": @"汽车之家 VR", @"url": kURL0},
                        @{@"title": @"易车 VR",    @"url": kURL1},
                        @{@"title": @"webp 静态图", @"url": kURL2},
                        @{@"title": @"webp 动图",  @"url": kURL3}];
    }
    return _dataArray;
}

- (UITableView *)baTableView {
    if (!_baTableView) {
        _baTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, BAKit_SCREEN_WIDTH, BAKit_SCREEN_HEIGHT-64)];
        _baTableView.delegate = self;
        _baTableView.dataSource = self;
        _baTableView.tableFooterView = [[UIView alloc] init];
    }
    return _baTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *data = self.dataArray[indexPath.row];
    cell.textLabel.text = data[@"title"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BAWebpController *webpVC = [[BAWebpController alloc] init];
    NSDictionary *data = self.dataArray[indexPath.row];
    webpVC.urlString = data[@"url"];
    [self.navigationController pushViewController:webpVC animated:YES];
}

@end
