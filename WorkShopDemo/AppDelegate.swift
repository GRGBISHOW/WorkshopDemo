//
//  AppDelegate.swift
//  WorkShopDemo
//
//  Created by Gurung Bishow on 10/11/19.
//  Copyright © 2019 Gurung Bishow. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
   
}


extension UIStoryboard {
    struct Main{
        private enum Identifier : String, StoryboardScene {
            
            static let storyboardName = "Main"
            case userListViewController = "UserListViewController"
        }
        
        static func UserListViewController() -> UserListViewController {
            return Identifier.userListViewController.viewController() as! UserListViewController
        }
    }
    
}

protocol StoryboardScene: RawRepresentable {
    
    static var storyboardName : String { get }
}

extension StoryboardScene  {
    
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    func viewController() -> UIViewController {
        return Self.storyboard().instantiateViewController(withIdentifier:self.rawValue as! String)
    }
}

protocol ViewIdentifiable: class {}
extension ViewIdentifiable where Self: UIView {
    static var name: String {
        return String(describing: self)
    }
}
