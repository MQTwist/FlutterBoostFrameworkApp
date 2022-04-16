//
//  ViewController.swift
//  FlutterFrameworkBoostApp
//
//  Created by MQTwist on 2022/4/16.
//

import UIKit
import Flutter
import flutter_boost

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mqButton()
    }
    
    func mqButton() {
        let btn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        btn.center = view.center
        btn.backgroundColor = .red
        btn.setTitle("Flutter", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func btnAction() {
        
//        let flutterVC = FlutterViewController(engine: (UIApplication.shared.delegate as! AppDelegate).flutterEngine!, nibName: nil, bundle: nil)
//        flutterVC.view.backgroundColor = .white
//        self.navigationController?.pushViewController(flutterVC, animated: true)
        
        let options = FlutterBoostRouteOptions()
        options.pageName = "home"
        
        //页面是否透明（用于透明弹窗场景），若不设置，默认情况下为true
        options.opaque = true
        
        //这个是push操作完成的回调，而不是页面关闭的回调！！！！
        options.completion = { completion in
            print("open operation is completed")
        }
        
        //这个是页面关闭并且返回数据的回调，回调实际需要根据您的Delegate中的popRoute来调用
        options.onPageFinished = { dic in
            print(dic as Any)
        }
        
        FlutterBoost.instance().open(options)
    }
    
}


