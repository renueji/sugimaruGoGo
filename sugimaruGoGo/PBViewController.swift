//
//  PBViewController.swift
//  sugimaruGoGo
//
//  Created by Rentaro on 2020/01/08.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import UIKit

class PBViewController: UIViewController {

    //デイトピッカーとラベルをコードと接続
    @IBOutlet weak var sugiTime: UIDatePicker!
    @IBOutlet weak var imajikan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }

        // Do any additional setup after loading the view
    
    //デイトピッカーが変更されたときの処理
    @IBAction func changeTime(_ sender: UIDatePicker) {
        //ラベルにデイトピッカーの値を表示
        imajikan.text = self.format(date: sugiTime.date)
        
    }
    
    //デイト型を文字列型にキャストする処理
    func format(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
        let mojijikan = dateformatter.string(from: date)

        return mojijikan

    }
    
    //画面遷移処理
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
//次の画面にデータを渡す
        if let controller = segue.destination as? PresentViewController {
            controller.uketime = imajikan.text!
        } else {
            print("")
        }
    }
        
        
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


