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
    var getTime: String = "00:00"
    
    //計算後の最終的な乗車する「時間」と「分」を格納するための
    var rideh: Int = 0
    var ridem: Int = 0
    
    //計算後の最終的な降車する「時間」と「分」を定めるための変数
    var getOffh: Int = 0
    var getOffm: Int = 0
    
    //全てのラベルをコードと接続
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //乗る「時間」と「分」の文字列を定めるための変数
        let rideHourStr: String =
            String(getTime.prefix(2))
        let rideMinStr: String =
            String(getTime.suffix(2))

        //乗る「時間」と「分」をInt型に変換
        guard let rideHourInt = Int(rideHourStr) else {
            self.firstLabel.text = "出発する時間を"
            self.secondLabel.text = "選んでね！"
            self.thirdLabel.text = ""
            
            return
        }
        
        let rideMinInt = Int(rideMinStr)!
        
        //「時間」を使った条件分岐を行うためのif文
        //乗る時間が7時台だったときの処理
        if rideHourInt == 07 {
            
            self.firstLabel.text = "8時15分のすぎ丸に乗れば…"
            self.secondLabel.text = "8時27分に西荻窪に着くよ！"
            
            return
        
        //乗る時間が7時よりも大きくて18時よりも小さいときの処理
        } else if rideHourInt > 07 && rideHourInt < 18 {
            
            //「分数」を使って分岐を行うswitch文
            switch rideMinInt {
            
            case(55...59):
                self.ridem = 15
                self.rideh = rideHourInt + 1
                self.getOffm = 27
                self.getOffh = rideHourInt
            
            case(0...14):
                    self.ridem = 15
                    self.rideh = rideHourInt
                    self.getOffm = 27
                    self.getOffh = rideHourInt
            
            case(15...34):
                self.ridem = 35
                self.rideh = rideHourInt
                self.getOffm = 47
                self.getOffh = rideHourInt
                
            case(35...54):
                self.ridem = 55
                self.rideh = rideHourInt
                self.getOffm = 07
                self.getOffh = rideHourInt + 1
                
            default: return
            }
            
            //乗る時間が19時台だったときの処理
        } else if rideHourInt == 19 {
                
            switch rideMinInt {
            case(0...14):
                    self.ridem = 15
                    self.rideh = rideHourInt
                    self.getOffm = 27
                    self.getOffh = rideHourInt
            
            case(16...34):
                self.ridem = 35
                self.rideh = rideHourInt
                self.getOffm = 47
                self.getOffh = rideHourInt
            
            //乗る時間が19時台で、なおかつ終電を過ぎていたときの処理
            default:
                self.firstLabel.text = "おいおい正気か？！"
                self.secondLabel.text = "もうすぎ丸は走ってないぜ！"
                self.thirdLabel.text = "諦めて歩いていきな！"
                
                return
            }
            
        //乗る時間が19時台よりも大きかった場合の処理
        } else if rideHourInt > 19 {
            self.firstLabel.text = "おいおい正気か？！"
            self.secondLabel.text = "もうすぎ丸は走ってないぜ！"
            self.thirdLabel.text = "諦めて歩いていきな！"
            
            return
            
        } else {
            self.firstLabel.text = "おいおい正気か？！"
            self.secondLabel.text = "まだすぎ丸は走ってないぜ！"
            self.thirdLabel.text = "諦めて歩いていきな！"
            
            return
            
        }
        
        //結果をラベルに反映させるための処理
        self.firstLabel.text = "\(rideh)時\(ridem)分のすぎ丸に乗れば…"
        self.secondLabel.text = "\(getOffh)時\(getOffm)分に西荻窪に着くよ！"
        
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



