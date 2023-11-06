//
//  SceneDelegate.swift
//  ChessApp
//
//  Created by 김도형 on 16/10/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = BoardViewController()
        self.window = window
        window.makeKeyAndVisible()
    }

}

