//
//  LoginViewController.swift
//  DemoView
//
//  Created by Nguyen Van Thieu B on 11/8/16.
//  Copyright © 2016 Thieu Mao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        // 1
        var nav = self.navigationController?.navigationBar
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
//        // 3
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .scaleAspectFit
//        // 4
//        let image = UIImage(named: "Apple_Swift_Logo")
//        imageView.image = image
//        // 5
//        navigationItem.titleView = imageView
        let title = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 30, height: 30))
        title.text = "Thieu Mao"
        title.textColor = UIColor.white
        navigationItem.titleView = title
        
        let myView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        myView.backgroundColor = UIColor.orange
        let language:UIBarButtonItem = UIBarButtonItem(customView: myView)
        navigationItem.rightBarButtonItem = language
    }
    
}
