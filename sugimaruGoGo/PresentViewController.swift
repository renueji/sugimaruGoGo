//
//  PresentViewController.swift
//  sugimaruGoGo
//
//  Created by Rentaro on 2020/01/08.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
    
    //前画面から時間を表す文字列を受け取るための変数
    var uketime: String = "00:00"
    
    //計算後の最終的な乗車する「時間」と「分」を格納するための
    var noruji: Int = 0
    var noruhun: Int = 0
    
    //計算後の最終的な降車する「時間」と「分」を定めるための変数
    var oriji: Int = 0
    var orihun: Int = 0
    
    //全てのラベルをコードと接続
    @IBOutlet weak var ichi: UILabel!
    @IBOutlet weak var nini: UILabel!
    @IBOutlet weak var kime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //乗る「時間」と「分」の文字列を定めるための変数
        let jikan: String =
            String(uketime.prefix(2))
        let hun: String =
            String(uketime.suffix(2))

        //乗る「時間」と「分」をInt型に変換
        guard let jikansu = Int(jikan) else {
            self.ichi.text = "出発する時間を"
            self.nini.text = "選んでね！"
            self.kime.text = ""
            
            return
        }
        
        let hunsu = Int(hun)!
        
        //「時間」を使った条件分岐を行うためのif文
        //乗る時間が7時台だったときの処理
        if jikansu == 07 {
            
            self.ichi.text = "8時15分のすぎ丸に乗れば…"
            self.nini.text = "8時27分に西荻窪に着くよ！"
            
            return
        
        //乗る時間が7時よりも大きくて18時よりも小さいときの処理
        } else if jikansu > 07 && jikansu < 18 {
            
            //「分数」を使って分岐を行うswitch文
            switch hunsu {
            
            case(55...59):
                self.noruhun = 15
                self.noruji = jikansu + 1
                self.orihun = 27
                self.oriji = jikansu
            
            case(0...14):
                    self.noruhun = 15
                    self.noruji = jikansu
                    self.orihun = 27
                    self.oriji = jikansu
            
            case(15...34):
                self.noruhun = 35
                self.noruji = jikansu
                self.orihun = 47
                self.oriji = jikansu
                
            case(35...54):
                self.noruhun = 55
                self.noruji = jikansu
                self.orihun = 07
                self.oriji = jikansu + 1
                
            default: return
            }
            
            //乗る時間が19時台だったときの処理
        } else if jikansu == 19 {
                
            switch hunsu {
            case(0...14):
                    self.noruhun = 15
                    self.noruji = jikansu
                    self.orihun = 27
                    self.oriji = jikansu
            
            case(16...34):
                self.noruhun = 35
                self.noruji = jikansu
                self.orihun = 47
                self.oriji = jikansu
            
            //乗る時間が19時台で、なおかつ終電を過ぎていたときの処理
            default:
                self.ichi.text = "おいおい正気か？！"
                self.nini.text = "もうすぎ丸は走ってないぜ！"
                self.kime.text = "諦めて歩いていきな！"
                
                return
            }
            
        //乗る時間が19時台よりも大きかった場合の処理
        } else if jikansu > 19 {
            self.ichi.text = "おいおい正気か？！"
            self.nini.text = "もうすぎ丸は走ってないぜ！"
            self.kime.text = "諦めて歩いていきな！"
            
            return
            
        } else {
            self.ichi.text = "おいおい正気か？！"
            self.nini.text = "まだすぎ丸は走ってないぜ！"
            self.kime.text = "諦めて歩いていきな！"
            
            return
            
        }
        
        //結果をラベルに反映させるための処理
        self.ichi.text = "\(noruji)時\(noruhun)分のすぎ丸に乗れば…"
        self.nini.text = "\(oriji)時\(orihun)分に西荻窪に着くよ！"
        
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



