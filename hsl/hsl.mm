//
//  hsl.mm
//  hsl
//
//  Created by CokePokes on 5/15/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <Foundation/Foundation.h>
#include <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>

@interface CNContactActionCell : UITableViewCell
@end

@interface CKDetailsLocationShareCell : UITableViewCell
@end

CHDeclareClass(CNContactActionCell);
CHOptimizedMethod0(self, UILabel*, CNContactActionCell, label)
{
    UILabel *orig = CHSuper0(CNContactActionCell, label);
    if ([orig.text isEqualToString:@"Stop Sharing My Location"]){
        [self setHidden:YES];
    }
    return orig;
}

CHDeclareClass(CKDetailsLocationShareCell);
CHOptimizedMethod0(self, void, CKDetailsLocationShareCell, layoutSubviews) {
    CHSuper0(CKDetailsLocationShareCell, layoutSubviews);
    [self setHidden:YES];
}


CHConstructor // code block that runs immediately upon load
{
	@autoreleasepool {
        
        //if ([NSProcessInfo.processInfo.processName isEqualToString:@"Contacts"]){
            CHLoadLateClass(CNContactActionCell);
            CHHook0(CNContactActionCell, label);
        //}
        
        CHLoadLateClass(CKDetailsLocationShareCell);
        CHHook0(CKDetailsLocationShareCell, layoutSubviews);        
	}
}
