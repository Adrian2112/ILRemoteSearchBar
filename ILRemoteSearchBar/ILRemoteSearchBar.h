//
//  ILRemoteSearchBar.h
//  ILRemoteSearchBar
//
//  Created by Adrian Gzz on 30/10/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILRemoteSearchBar;

@protocol ILRemoteSearchBarDelegate <NSObject, UISearchBarDelegate>

- (void)remoteSearchBar:(ILRemoteSearchBar *)searchBar textDidChange:(NSString *)searchText;

@end


@interface ILRemoteSearchBar : UISearchBar

// time to wait in seconds before calling the delegate with the text changed
// default: 0.5 seconds
@property (nonatomic, assign) NSTimeInterval timeToWait;

@end

