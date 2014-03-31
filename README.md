#ILRemoteSearchBar

A UISearchBar subclass that observes the search field on a given frequency.

This is meant to be used to query a remote server after the text on search field is changed without firing the search for each character typed.
                    
The search field fires the delegate method after the user stops writing for an specified time interval.

<img src="https://raw.github.com/icalialabs/ILRemoteSearchBar/master/demo.gif" alt="ILRemoteSearchBar demo" title="ILRemoteSearchBar demo" style="display:block; margin: 10px auto 30px auto; align:center">


##Usage

Install with [cocoapods](http://cocoapods.org/)

```
pod 'ILRemoteSearchBar'
```


Make your view controller conforms to `ILRemoteSearchBarDelegate` protocol

```objective-c
@interface ILViewController () <ILRemoteSearchBarDelegate>

```

Set the search bars delegate to your view controller
(programatically with the viewDidLoad or via interface builder)

```objective-c
ILRemoteSearchBar *searchBar = [[ILRemoteSearchBar alloc] ...];

searchBar.delegate = self;
```

Add the remoteSearchBar:textDidChange: method to your view controller and call your API from there

```objective-c
# pragma mark - ILRemoteSearchBarDelegate

- (void)remoteSearchBar:(ILRemoteSearchBar *)searchBar
          textDidChange:(NSString *)searchText
{
	// call your api
}

```

You can even conform to `UISearchBarDelegate` and receive the delegate
methods for your `ILRemoteSearchBar`

###Warning
If your view controller is conforming to the UISearchBarDelegate the
`searchBar:TextDidChange:` will be called when your `ILRemoteSearchBar`
text is changed as `ILRemoteSearchBar` is a subclass of `UISearchBar`
so make sure to check that the sender object is not your `ILRemoteSearchBar`

```objective-c
-(void)searchBar:(UISearchBar *)searchBar
		textDidChange:(NSString *)searchText
{
  if (searchBar != self.myRemoteSearchBar) {
    // do your thing
  }
}
```

## Configuration
You can change the time interval to wait before the delegate method is called with

```objective-c
searchBar.timeToWait = 0.5; // 0.5 is the default value
```

## Author
**Adrián González**
+ [http://github.com/adrian2112](http://github.com/adrian2112)


##License

The MIT License (MIT)

Copyright (c) 2013 Adrián González \<bernardogzzf@gmail.com\>

Permission is hereby granted, free of charge, to any person obtaining a
copy
of this software and associated documentation files (the "Software"), to
deal
in the Software without restriction, including without limitation the
rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN
THE SOFTWARE.

