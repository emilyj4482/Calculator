//
//  SceneDelegate.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .black
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        // screen 크기 전송
        let vm = MainViewModel()
        vm.screen.send((width: windowScene.screen.bounds.width, height: windowScene.screen.bounds.height))
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}

