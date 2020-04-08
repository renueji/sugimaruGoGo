//
//  ViewController.swift
//  sugimaruGoGo
//
//  Created by Rentaro on 2020/01/08.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import UIKit
import SafariServices

class OnWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Webページを表示させるための処理
        let url = URL(string: "https://www.city.suginami.tokyo.jp/guide/machi/jikoku/1014647.html")
        if let url = url {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
    }
    
    //「もう一度見る」ボタンがタップされたときの処理
    @IBAction func oneMoreButtonTaped(_ sender: UIButton) {
        self.viewDidLoad()
    }

}

