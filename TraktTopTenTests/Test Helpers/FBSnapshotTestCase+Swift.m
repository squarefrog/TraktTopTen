//
//  FBSnapshotTestCase+Swift.m
//  TraktTopTen
//
//  Created by Paul Williamson on 19/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

#import "FBSnapshotTestCase+Swift.h"
//
//#ifndef FB_REFERENCE_IMAGE_DIR
//#define FB_REFERENCE_IMAGE_DIR="\"$(SOURCE_ROOT)/$(PROJECT_NAME)Tests/ReferenceImages\""
//#endif

@implementation FBSnapshotTestCase (Swift)

- (void)snapshotVerifyView:(UIView *)view withIdentifier:(NSString *)identifier
{
    FBSnapshotVerifyView(view, identifier);
}

@end
