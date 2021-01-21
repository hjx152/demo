//
//  ViewController.m
//  photoPage
//
//  Created by 金现代 on 2021/1/15.
//  Copyright © 2021年 hjx. All rights reserved.
//

#import "ViewController.h"
//#import "XMQueue.h"
//#import "SDCycleScrollView.h"

@interface ViewContrVoller : UIImageView

/** 内存缓存 */
@property (nonatomic, strong) NSMutableDictionary *mDicImages;
- (void)asynSetImage:(NSString *)imagePath placeholderImage:(UIImage *)placeholderImg;


@end



#define SLBannerViewWidth self.bounds.size.width
#define SLBannerViewHeight self.bounds.size.height

static int imagesCount = 3;

@interface ViewController ()  <UIScrollViewDelegate>

// 轮播图视图
@property (nonatomic,strong) UIView *contentView;
///轮播图片地址集合
@property (nonatomic,strong) NSMutableArray<NSString *> *imageUrl;

/** 滚动视图 */
//@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
/** 页控制 圆点 */
//@property (nonatomic, weak) IBOutlet UIPageControl *pageCtrl;
@property (nonatomic, weak) IBOutlet UIPageControl *pageCtrl;
/** 定时器,用weak */
//@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
//    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//   CircleLayout *layout = [[CircleLayout alloc] init];
    
}


/** xib快速构造方法 */
+ (instancetype)bannerViewXib
{
    //    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
#define SLBannerViewBundle [NSBundle bundleForClass:[self class]]
    return [SLBannerViewBundle loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

/** xib 创建 */
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setup];
}

/** 代码快速构造方法 */
+ (instancetype)bannerView
{
    return [[self alloc] init];
}

/** 代码创建 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子控件
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        UIPageControl *pageCtrl = [[UIPageControl alloc] init];
        [self addSubview:pageCtrl];
        self.pageCtrl = pageCtrl;
        
        [self setup];
    }
    return self;
}


#pragma mark - 控件设置
/** 基础设置 */
- (void)setup
{
    //设置时间间隔
    _imgStayTimeInterval = 2;
    _durTimeInterval = 0.3;
    
    for (int i = 0; i < imagesCount; i++) {
        ViewController *imageView = [[ViewController alloc] initWithFrame:CGRectMake(i * SLBannerViewWidth, 0, SLBannerViewWidth, SLBannerViewHeight)];
        [self.scrollView addSubview:imageView];
        
        //给每个pic设置点击手势
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClicked:)];
        [imageView addGestureRecognizer:tap];
    }
    
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(imagesCount * SLBannerViewWidth, 0);
    
    //pageCtrl的当前页背景颜色和默认颜色
    self.pageCtrl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageCtrl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageCtrl.hidesForSinglePage = YES;
    
}

/** 重新布局子控件 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //重写scroll的布局
    self.scrollView.frame = self.bounds;
    self.scrollView.layer.cornerRadius = 5.0f;
    //不重新设置contentSize，无法用手势拖动图片
    self.scrollView.contentSize = CGSizeMake(imagesCount * SLBannerViewWidth, 0);
    
    for (int i = 0; i < imagesCount; i++) {
        ViewContrVoller *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * SLBannerViewWidth, 0, SLBannerViewWidth, SLBannerViewHeight);
        
    }
    //重写pageCtrl的布局，默认居中，可根据项目需求修改位置
    CGFloat pageCtrlW = 60;
    CGFloat pageCtrlH = 40;
    CGFloat pageCtrlX = (SLBannerViewWidth - pageCtrlW) / 2;
    CGFloat pageCtrlY = SLBannerViewHeight - pageCtrlH;
    self.pageCtrl.frame = CGRectMake(pageCtrlX, pageCtrlY, pageCtrlW, pageCtrlH);
    
    //重写titleLabel的布局
    CGFloat titleH = 40;
    self.titleLabel.frame = CGRectMake(0, SLBannerViewHeight - titleH, SLBannerViewWidth, titleH);
    //1. 修复bug,让其默认从第0页开始
    self.pageCtrl.currentPage = 0;
    ViewContrVoller *imageView = self.scrollView.subviews[0];
    [imageView asynSetImage:self.slImages[0] placeholderImage:self.placeholderImg];
    //2. 修复bug, 让其加载完成，就展示第二个imageView
    self.scrollView.contentOffset = CGPointMake(SLBannerViewWidth, 0);
    
}

/** 设置单张图片不轮播 */
- (void)setupSingleImage
{
    ViewContrVoller *imageView = [[ViewContrVoller alloc] initWithFrame:self.bounds];
    [self addSubview:imageView];
    [imageView asynSetImage:self.slImages.firstObject placeholderImage:_placeholderImg];
    imageView.tag = 0;
    //给pic设置点击手势
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClicked:)];
    [imageView addGestureRecognizer:tap];
}




//- (instancetype)initWithFrame:(CGRect)frame
//{
//
//    self = [super initWithFrame:frame];
//
//
//    if (self) {
//
//        ///初始化轮播图视图
//        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        ///超出部分裁剪
//        _contentView.clipsToBounds = YES;
//        ///添加到XMRotationChartView
//        [self addSubview:_contentView];
//
//    }
//    return self;
//}

@end




