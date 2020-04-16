import PlaygroundSupport
import UIKit


let viewController = MyViewController(screenType: .mac , isPortrait: true)
let navigation = UINavigationController(rootViewController: viewController)
navigation.navigationBar.isHidden = true
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)

// Present the view controller in the Live View window
//
