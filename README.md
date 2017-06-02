![SwiftyModuleTransition](https://raw.githubusercontent.com/rock88/SwiftyModuleTransition/assets/Logo.png)

SwiftyModuleTransition
========
[![Build Status](https://travis-ci.org/rock88/SwiftyModuleTransition.svg?branch=master)](https://travis-ci.org/rock88/SwiftyModuleTransition)
[![Coverage Status](https://coveralls.io/repos/github/rock88/SwiftyModuleTransition/badge.svg?branch=master)](https://coveralls.io/github/rock88/SwiftyModuleTransition?branch=master)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platforms](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://github.com/rock88/SwiftyModuleTransition)
[![Swift Version](https://img.shields.io/badge/Swift-3-F16D39.svg?style=flat)](https://developer.apple.com/swift)

SwiftyModuleTransition is a framework for easily modules transition in projects with VIPER or some other Clean architecture.

Inspired by [ViperMcFlurry](https://github.com/rambler-digital-solutions/ViperMcFlurry).

## Requirements:
- iOS 8.0+
- Xcode 8+

## Installation:
For now SwiftyModuleTransition available only through [Carthage](https://github.com/Carthage/Carthage) or Manually.

### Carthage
Just add to your Cartfile:
```
github "rock88/SwiftyModuleTransition" ~> 1.0.0
```

### Manually
- Clone/Download SwiftyModuleTransition.
- Drag the SwiftyModuleTransition.xcodeproj to your Xcode project.
- In the project configuration window select the application target and add SwiftyModuleTransition.framework to "Embedded Binaries" section.

## Usage:
For example we have a ```NewsList``` and ```NewsDescription```  modules and should present ```NewsDescription``` with some ```NewsItem``` from ```NewsList```.

Structure of ```NewsList``` module:
```swift
protocol NewsListViewInput: class {
    
}

protocol NewsListViewOutput: class {
    func viewDidSelectNews(at index: Int)
}

class NewsListPresenter: NewsListViewOutput {
    weak var view: NewsListViewInput!
    var router: NewsListRouterInput!
    
    var newsList: [NewsItem]!
    
    func viewDidSelectNews(at index: Int) {
        let newsItem = newsList[index]
        router.openNewsDescriptionScreen(newsItem: newsItem)
    }
}

class NewsListViewController: UIViewController, ModuleView, NewsListViewInput {
    var output: NewsListViewOutput!
}

protocol NewsListRouterInput {
    func openNewsDescriptionScreen(newsItem: NewsItem)
}

class NewsListRouter: NewsListRouterInput {
    weak var transitionHandler: ModuleTransitionHandler!
    var newsDescriptionModuleFactory: ModuleFactory<NewsDescriptionViewController>!
    
    func openNewsDescriptionScreen(newsItem: NewsItem) {
    
    }
}
```

And ```NewsDescription``` module:

```swift
protocol NewsDescriptionModuleInput: class {
    var newsItem: NewsItem! { get set }
}

protocol NewsDescriptionViewInput: class {
    
}

protocol NewsDescriptionViewOutput: class {
    
}

class NewsDescriptionPresenter: NewsDescriptionModuleInput, NewsDescriptionViewOutput {
    weak var view: NewsDescriptionViewInput!
    var newsItem: NewsItem!
}

class NewsDescriptionViewController: UIViewController, ModuleView, NewsDescriptionViewInput {
    var output: NewsDescriptionViewOutput!
}
```

Firstly need correct create this modules, you can create modules & factory manually or use your prefered DI framework:

```swift
let view = NewsListViewController()
let presenter = NewsListPresenter()
let router = NewsListRouter()

view.output = presenter
presenter.view = view
presenter.router = router
router.transitionHandler = view

router.newsDescriptionModuleFactory = ModuleFactory<NewsDescriptionViewController> {
    let view = NewsDescriptionViewController()
    let presenter = NewsDescriptionPresenter()
    
    view.output = presenter
    presenter.view = view
    
    return view
}
```

Then implement ```func openNewsDescriptionScreen(newsItem: NewsItem)```:

```swift
func openNewsDescriptionScreen(newsItem: NewsItem) {
    transitionHandler.openModule(factory: newsDescriptionModuleFactory)
        .configure { (input: NewsDescriptionModuleInput) in
            input.newsItem = newsItem
        }
        .transition { (source, destination) in
            source.navigationController?.pushViewController(destination, animated: true)
        }
}
```

## To-Do:
- [ ] Add example project.
- [ ] Better Input type checking.
- [ ] Support storyboard segue transition.
- [ ] Support other platform.
