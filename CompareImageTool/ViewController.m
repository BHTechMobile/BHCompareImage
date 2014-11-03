//
//  ViewController.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak) IBOutlet NSLayoutConstraint *spacingFromLeft;
@property (weak) IBOutlet NSLayoutConstraint *image1SpacingFromLeft;
@property (weak) IBOutlet NSSlider *slider;
@property (weak) IBOutlet NSImageView *image1;
@property (weak) IBOutlet NSImageView *image2;
@property (weak) IBOutlet NSSegmentedControl *segmentControl;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

#pragma mark - Actions

- (IBAction)changeValue:(id)sender {
    NSSlider * slider = (NSSlider*)sender;
    NSLog(@"%s %d",__PRETTY_FUNCTION__,slider.intValue);
    if (_segmentControl.selectedSegment == 1) {
        _image1.alphaValue = 1.0 - slider.intValue/100.0;
        _image1SpacingFromLeft.constant = 0;

    }
    else {
//        _spacingFromLeft.constant = 480 * (slider.intValue/100.0);
        _image1SpacingFromLeft.constant = 480 * (slider.intValue/100.0);
        
    }
    NSLog(@"%f",_image1SpacingFromLeft.constant);
}
- (IBAction)segmentChanged:(id)sender {
    [self changeValue:_slider];
}

- (IBAction)updateFrame:(id)sender {
    _image1.imageAlignment = [sender tag];
    _image2.imageAlignment = [sender tag];
}

- (IBAction)clickImage1:(id)sender {
    
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:YES];
    [panel setAllowsMultipleSelection:NO];
    
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSFileHandlingPanelOKButton) {
        for (NSURL *url in [panel URLs]) {
            NSLog(@"%@",url);
            // do something with the url here.
            _image1.image = [[NSImage alloc] initWithContentsOfURL:url];
        }
    }
    
}
- (IBAction)clickImage2:(id)sender {
    
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:YES];
    [panel setAllowsMultipleSelection:NO];
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSFileHandlingPanelOKButton) {
        for (NSURL *url in [panel URLs]) {
            NSLog(@"%@",url);
            // do something with the url here.
            _image2.image = [[NSImage alloc] initWithContentsOfURL:url];
        }
    }
    
}

NSComparisonResult compareViews(id firstView, id secondView, void *context) {
    NSInteger firstTag = [firstView tag];
    NSInteger secondTag = [secondView tag];
    
    if (firstTag == secondTag) {
        return NSOrderedSame;
    } else {
        if (firstTag < secondTag) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }
}



@end
