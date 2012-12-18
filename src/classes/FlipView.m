// Hive Pingu Service
// Copyright (C) 2008-2012 Hive Solutions Lda.
//
// This file is part of Hive Pingu Service.
//
// Hive Pingu Service is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Hive Pingu Service is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Hive Pingu Service. If not, see <http://www.gnu.org/licenses/>.

// __author__    = João Magalhães <joamag@hive.pt>
// __version__   = 1.0.0
// __revision__  = $LastChangedRevision$
// __date__      = $LastChangedDate$
// __copyright__ = Copyright (c) 2008-2012 Hive Solutions Lda.
// __license__   = GNU General Public License (GPL), Version 3

#import "FlipView.h"

@implementation FlipView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.up = NO;
        self.enabled = NO;
        self.currentView = nil;
        
        self.contentMode = UIViewContentModeScaleToFill;
        self.autoresizesSubviews = YES;
        
        self.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        self.frontView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tobias.jpg"]];
        self.backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tobias2.jpg"]];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.up = NO;
        self.enabled = NO;
        self.currentView = nil;
    }
    return self;
}

- (void)enable {
    if(self.enabled) { return; }

    self.frontView.hidden = YES;
    self.backView.hidden = YES;
    [self addSubview:self.frontView];
    [self addSubview:self.backView];
    self.currentView = self.frontView;
    self.currentView.hidden = NO;

    self.enabled = YES;
}

- (void)disable {
    if(!self.enabled) { return; }
    
    [self.frontView removeFromSuperview];
    [self.backView removeFromSuperview];
    self.enabled = NO;
}

- (void)toggle {
    if(self.up) { [self bringDown]; }
    else { [self bringUp]; }
}

- (void)bringUp {
    if(self.up) { return; }
    
    self.currentView.hidden = YES;
    self.currentView = self.backView;

    float width = 640;
    float height = 640;
    float x = self.superview.frame.size.width / 2.0f - width / 2.0f;
    float y = self.superview.frame.size.height / 2.0f - height / 2.0f;
    CGRect frame = CGRectMake(x, y, width, height);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    
    [self setFrame:frame withRatio:0.15];    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:self
                             cache:YES];
    
    [UIView commitAnimations];
    
    self.currentView.hidden = NO;
    
    self.up = YES;
}

- (void)bringDown {
    if(!self.up) { return; }
    
    self.currentView.hidden = YES;
    self.currentView = self.frontView;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    
    [self setFrame:self.baseFrame withRatio:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self
                             cache:YES];
    
    [UIView commitAnimations];
    
    self.currentView.hidden = NO;
    
    self.up = NO;
}

- (void)setFrame:(CGRect)frame withRatio:(float)ratio {
    float width = frame.size.width * (ratio + 1.0);
    float height = frame.size.height * (ratio + 1.0);
    float xOffset = frame.size.width * (ratio / 2.0);
    float yOffset = frame.size.height * (ratio / 2.0);
    
    [super setFrame:CGRectMake(
        frame.origin.x - xOffset, frame.origin.y - yOffset, width, height
    )];
}

- (void)setInnerFrame:(CGRect)frame withRatio:(float)ratio {
    float xOffset = frame.size.width * (ratio / 2.0);
    float yOffset = frame.size.height * (ratio / 2.0);
    
    self.frontView.frame = CGRectMake(
        xOffset, yOffset, frame.size.width, frame.size.height
    );
    self.backView.frame = CGRectMake(
        xOffset, yOffset, frame.size.width, frame.size.height
    );
}

- (void)setFrontView:(UIView *)frontView {
    _frontView = frontView;
    _frontView.autoresizingMask |= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if(self.currentView == nil) { self.currentView = frontView; }
}

- (void)setBackView:(UIView *)frontView {
    _backView = frontView;
    _backView.autoresizingMask |= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)setBaseFrame:(CGRect)baseFrame {
    _baseFrame = baseFrame;
    [self setFrame:baseFrame withRatio:0.75];
    [self setInnerFrame:baseFrame withRatio:0.75];
}

@end
