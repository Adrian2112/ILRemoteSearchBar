//
//  ILRemoteSearchBar.m
//  ILRemoteSearchBar
//
//  Created by Adrian Gzz on 30/10/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import "ILRemoteSearchBar.h"

@interface ILRemoteSearchBar () <UISearchBarDelegate>

@property (strong, nonatomic) NSTimer *searchTimer;
@property (strong, nonatomic) id <ILRemoteSearchBarDelegate> remoteSearchDelegate;

@end

@implementation ILRemoteSearchBar

-(void)setDelegate:(id <ILRemoteSearchBarDelegate, UISearchBarDelegate>)delegate
{
    [super setDelegate:self];
    self.remoteSearchDelegate = delegate;
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // forward method call to delegate
    if ([self.remoteSearchDelegate respondsToSelector:@selector(searchBar:textDidChange:)]) {
        [self.remoteSearchDelegate searchBar:searchBar textDidChange:searchText];
    }
    
    if (self.searchTimer) {
        [self.searchTimer invalidate];
    }
    self.searchTimer = nil;
    self.searchTimer = [NSTimer scheduledTimerWithTimeInterval:self.timeToWait target:self selector:@selector(fireSearch:) userInfo:nil repeats:NO];
}

-(void)fireSearch:(ILRemoteSearchBar *)remoteSearchBar
{
    if (self.remoteSearchDelegate &&
        [self.remoteSearchDelegate respondsToSelector:@selector(remoteSearchBar:textDidChange:)])
    {
        [self.remoteSearchDelegate remoteSearchBar:self textDidChange:self.text];
    }
}

-(NSTimeInterval)timeToWait
{
    if (_timeToWait == 0) {
        double timeToWait = 0.5;
        _timeToWait = timeToWait;
    }
    
    return (_timeToWait);
}


#pragma mark - UISearchBarDelegate forwarding
-(BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.remoteSearchDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}


-(id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.remoteSearchDelegate respondsToSelector:aSelector]) {
        return self.remoteSearchDelegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}
@end
