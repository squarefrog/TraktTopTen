# TraktTopTen

TraktTopTen is a sample Swift app that downloads the 10 most popular movies from Trakt, and displays the banners in a `UICollectionView`. It demonstrates the following:

- Unit tests using XCTest
- Network calls using `NSURLSession`
- Parsing json using [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

# Running the app

Clone the repo:

    $ git clone --recursive https://github.com/squarefrog/TraktTopTen.git

Install dependencies (requires [CocoaPods](https://cocoapods.org))

    $ cd TraktTopTen && pod install

Then open up the TraktTopTen.xcworkspace.
