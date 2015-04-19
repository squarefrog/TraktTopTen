//
//  FBSnapshotTestCase+Swift.m
//  TraktTopTen
//
//  Created by Paul Williamson on 19/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

#import "FBSnapshotTestCase+Swift.h"

@implementation FBSnapshotTestCase (Swift)

- (void)snapshotVerifyView:(UIView *)view withIdentifier:(NSString *)identifier
{
    FBSnapshotVerifyView(view, identifier);
}

- (void)snapshotVerifyLayer:(CALayer *)layer withIdentifier:(NSString *)identifier
{
    FBSnapshotVerifyLayer(layer, identifier);
}

@end
