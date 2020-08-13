//
//  SceneDelegate.swift
//  TrialProject
//
//  Created by Mustafa on 8/7/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        showHome()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

//MARK:-  HOME TAB BAR
extension SceneDelegate{
    
    func showHome(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyBoard.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
        tabBarController.tabBar.barTintColor = .black
        
        let home = storyBoard.instantiateViewController(withIdentifier: "Home") as! Home
        home.tabBarItem.image = #imageLiteral(resourceName: "Vector-1")
        //home.tabBarItem.selectedImage = #imageLiteral(resourceName: "Vector-2")
        let homeNavController = BaseNavigationController(rootViewController:home)
        homeNavController.navigationBar.isHidden = true
        
        let route = storyBoard.instantiateViewController(withIdentifier: "Route") as! Route
        route.tabBarItem.image = #imageLiteral(resourceName: "Vector-11")
        //route.tabBarItem.selectedImage = #imageLiteral(resourceName: "Vector-2")
        
        
        let speak = storyBoard.instantiateViewController(withIdentifier: "Speak") as! Speak
        speak.tabBarItem.image = #imageLiteral(resourceName: "Vector-14")
        //speak.tabBarItem.selectedImage = #imageLiteral(resourceName: "Vector-2")
        
        
        let calendar = storyBoard.instantiateViewController(withIdentifier: "Calender") as! Calender
        calendar.tabBarItem.image = #imageLiteral(resourceName: "Vector-12")
        //calendar.tabBarItem.selectedImage = #imageLiteral(resourceName: "Vector-2")
        
        
        let menu = storyBoard.instantiateViewController(withIdentifier: "Menu") as! Menu
        menu.tabBarItem.image = #imageLiteral(resourceName: "Vector-13")
        //menu.tabBarItem.selectedImage = #imageLiteral(resourceName: "Vector-2")
        
        
        
        
        tabBarController.viewControllers = [homeNavController,calendar,speak,menu,route]
        
        for tabBarItem in tabBarController.tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
    }
    
}
