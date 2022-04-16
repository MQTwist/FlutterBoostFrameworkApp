//
//  AppDelegate.swift
//  FlutterFrameworkBoostApp
//
//  Created by MQTwist on 2022/4/16.
//

import UIKit

import Flutter
import flutter_boost

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var flutterEngine: FlutterEngine?
    private var nav: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.backgroundColor = .white
        nav = UINavigationController.init(rootViewController: ViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        loadFlutter(application)
        return true
    }

    private func loadFlutter(_ application: UIApplication) {
        //创建代理，做初始化操作
        let boostDelegate = HYBoostDelegate()
        boostDelegate.navigationController = nav!
        FlutterBoost.instance().setup(application, delegate: boostDelegate, callback: { [weak self] (engine) in
            self?.flutterEngine = engine
            debugPrint(">>> engine init succ")
        })
    }

}


