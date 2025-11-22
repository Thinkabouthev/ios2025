//
//  SceneDelegate.swift
//  favouritesApp
//
//  Created by Dariya Zhaxylykova on 22.11.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let songs = storyboard.instantiateViewController(identifier: "Song")
        let movies = storyboard.instantiateViewController(identifier: "Movies")
        let books = storyboard.instantiateViewController(identifier: "Books")
        let courses = storyboard.instantiateViewController(identifier: "Courses")

        songs.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note"), tag: 0)
        movies.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film"), tag: 1)
        books.tabBarItem = UITabBarItem(title: "Books", image: UIImage(systemName: "book"), tag: 2)
        courses.tabBarItem = UITabBarItem(title: "Courses", image: UIImage(systemName: "graduationcap"), tag: 3)

        let nav1 = UINavigationController(rootViewController: songs)
        let nav2 = UINavigationController(rootViewController: movies)
        let nav3 = UINavigationController(rootViewController: books)
        let nav4 = UINavigationController(rootViewController: courses)

        let tabBar = UITabBarController()
        tabBar.viewControllers = [nav1, nav2, nav3, nav4]

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

