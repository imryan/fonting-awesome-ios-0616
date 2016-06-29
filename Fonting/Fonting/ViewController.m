//
//  ViewController.m
//  Fonting
//
//  Created by Ryan Cohen on 6/29/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import "ViewController.h"

#import "FontAwesomeKit/FontAwesomeKit.h"
#import "CWStatusBarNotification.h"
#import <ChameleonFramework/Chameleon.h>

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UILabel *fontAwesomeLabel;
@property (nonatomic, strong) IBOutlet UIButton *changeFontButton;

- (IBAction)change:(id)sender;

@end

@implementation ViewController

#pragma mark - Actions

- (IBAction)change:(id)sender {
    NSDictionary *icons = [FAKFontAwesome allIcons];
    NSArray *keys = icons.allKeys;
    NSUInteger random = arc4random_uniform((uint32_t)keys.count);
    
    FAKIcon *icon = [FAKFontAwesome iconWithCode:keys[random] size:70.f];
    [icon addAttribute:NSForegroundColorAttributeName value:[UIColor randomFlatColor]];
    
    CWStatusBarNotification *notification = [CWStatusBarNotification new];
    notification.notificationLabelBackgroundColor = [UIColor flatGrayColor];
    
    [notification displayNotificationWithMessage:[NSString stringWithFormat:@"This is %@!", icon.iconName] forDuration:1.f];
    
    self.fontAwesomeLabel.attributedText = icon.attributedString;
}

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    [self change:nil];
    [self.view removeConstraints:self.view.constraints];
    
    [self.changeFontButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20.f].active = YES;
    [self.changeFontButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:20.f].active = YES;
    [self.changeFontButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20.f].active = YES;
    
    [self.fontAwesomeLabel.bottomAnchor constraintEqualToAnchor:self.changeFontButton.topAnchor constant:-30.f].active = YES;
    [self.fontAwesomeLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20.f].active = YES;
    [self.fontAwesomeLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20.f].active = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
