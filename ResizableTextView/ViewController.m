//
//  ViewController.m
//  ResizableTextView
//
//  Created by Tapan Thaker on 07/08/14.
//  Copyright (c) 2014 Tapan. All rights reserved.
//

#import "ViewController.h"
#import "ResizableTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ResizableTextView *resizableTextView = [[ResizableTextView alloc]initWithFrame:CGRectMake(0,22, 320, 200)];
    resizableTextView.minimumFontSizeInPoints=13;
    resizableTextView.maximumFontSizeInPoints=41;
    resizableTextView.backgroundColor=[UIColor grayColor];
    resizableTextView.font=[UIFont fontWithName:@"HelveticaNeue" size:resizableTextView.maximumFontSizeInPoints];
    
    
    [self.view addSubview:resizableTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
