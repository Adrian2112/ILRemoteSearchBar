//
//  ILViewController.m
//  ILRemoteSearchBarExample
//
//  Created by Adrian Gzz on 30/10/13.
//  Copyright (c) 2013 Icalia Labs. All rights reserved.
//

#import "ILViewController.h"
#import "ILRemoteSearchBar.h"

@interface ILViewController () <ILRemoteSearchBarDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet ILRemoteSearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ILViewController

-(void)viewDidLoad
{
    self.searchBar.timeToWait = 0.5; // the default value is 0.5 you can change it with this variable
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.searchBar resignFirstResponder];
}

# pragma mark - ILRemoteSearchBarDelegate

-(void)remoteSearchBar:(ILRemoteSearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.label.text = searchText;
}

#pragma mark - UISearchBarDelegate

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar != self.searchBar) {
        self.label.text = searchText;
    }
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"search bar text did begin editing");
}

@end
