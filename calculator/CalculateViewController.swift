//
//  CalculateViewController.swift
//  calculator
//
//  Created by Huang Hao on 2017/11/6.
//  Copyright © 2017年 Huang Hao. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    @IBOutlet weak var exceptBToutlet: UIButton!
    @IBOutlet weak var multiplyBToutlet: UIButton!
    @IBOutlet weak var lessBToutlet: UIButton!
    @IBOutlet weak var addBToutlet: UIButton!
    @IBOutlet weak var ResultBToutlet: UIButton!
    
    
    var choice = ""
    var Resultchoice = ""
    var numberclick: Bool = false
    var totalNumber: Double = 0
    var oneNumber:Double = 0
    var TwoNumber:Double = 0
    var ThreeNumber:Double = 0
    let blackcolor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    //這是取得數值的，當他觸發後會取numberLabel內的值，跑到set後 numberLabel就重置了。
    var getnumber:Double {
        get {
            return Double(NumberLabel.text!)!
        }
        set {
            NumberLabel.text = "\(newValue)"
            numberclick = false
        }
    }

    enum select{
        case add,less,multiply,except
    }
    
    
    //比對Button的選項
    func Resultnumber (){
        if choice == "+"{
            totalNumber = oneNumber + TwoNumber
            NumberLabel.text = "\(totalNumber)"
        }
        if choice == "-"{
            totalNumber = oneNumber - TwoNumber
            NumberLabel.text = "\(totalNumber)"
        }
        if choice == "×"{
            totalNumber = oneNumber * TwoNumber
            NumberLabel.text = "\(totalNumber)"
        }
        if choice == "÷"{
            totalNumber = oneNumber / TwoNumber
            NumberLabel.text = "\(totalNumber)"
        }
    }
    
    
    //當按下加減乘除的數字後，choice會取得Button按鍵的Title。
    @IBAction func OrangeColorBTAction(_ sender: UIButton){
        choice = sender.currentTitle!
        print(choice)
        numberclick = false
        oneNumber = getnumber
    }
    

    @IBOutlet var numberBT: [UIButton]!
    
    @IBAction func numberBT(_ sender: UIButton) {
        let number = sender.currentTitle
        
        if numberclick,NumberLabel.text != ""{
            NumberLabel.text = NumberLabel.text! + number!
            print("\(NumberLabel.text)")
        }else{
            if number != "0"{
                NumberLabel.text = number!
                numberclick = true
            }else {
                NumberLabel.text = "0"
            }
            
        }
    }
    

    //清空所有數值
    @IBAction func ClearBT(_ sender: UIButton) {
        totalNumber = 0
        oneNumber = 0
        TwoNumber = 0
        NumberLabel.text = "\(totalNumber)"
        numberclick = false
    }
    //使用者按下 = 鍵後取得使用者輸入的第二個數字然後比對做運算
    @IBAction func ResultBT(_ sender: UIButton) {
        TwoNumber = getnumber
        Resultnumber()
    }
    

    
    @IBOutlet weak var NumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBToutlet.layer.borderColor = UIColor.black.cgColor
        self.addBToutlet.layer.borderWidth = 1.5
        self.lessBToutlet.layer.borderWidth = 1.5
        self.lessBToutlet.layer.borderColor = UIColor.black.cgColor
        self.multiplyBToutlet.layer.borderWidth = 1.5
        self.multiplyBToutlet.layer.borderColor = UIColor.black.cgColor
        self.exceptBToutlet.layer.borderWidth = 1.5
        self.exceptBToutlet.layer.borderColor = UIColor.black.cgColor
        self.ResultBToutlet.layer.borderWidth = 1.5
        self.ResultBToutlet.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
