//
//  FBSnapshotTestCase+Swift.h
//  TraktTopTen
//
//  Created by Paul Williamson on 19/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

#import "FBSnapshotTestCase.h"

@interface FBSnapshotTestCase (Swift)

- (void)snapshotVerifyView:(UIView *)view withIdentifier:(NSString *)identifier;

@end
