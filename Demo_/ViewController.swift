//
//  ViewController.swift
//  Demo_
//
//  Created by Admin on 8/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    @IBOutlet weak var lbl_dau: UILabel!
    
    
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    
    var number_1: Int?
    var number_2: Int?
    var number_3: Int?
    var kq: Int?
    var dung = 0
    var sai = 0
    var countTimer = 5
    var timer = NSTimer()
    var dau = 0
    
    
    
    
    @IBOutlet weak var lbl_right: UILabel!
    @IBOutlet weak var lbl_wrong: UILabel!
    
    @IBOutlet weak var lbl_timer: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
        setRandom()
        
    }
    
    

    @IBAction func btn_Action(sender: UIButton) {
        
//        setRandom()
        right_wrong()
        setRandom()
        


    }
    func right_wrong() {
        if(btn_1.touchInside){
            if(number_1 == kq){
                dung += 1
            }else{
                sai += 1
            }
        }else if(btn_2.touchInside){
            if(number_2 == kq){
                dung += 1
            }else{
                sai += 1
            }
            
        }else if(btn_3.touchInside){
            if(number_3 == kq){
                dung += 1
            }else{
                sai += 1
            }
        }
        
        lbl_right.text = String(dung)
        lbl_wrong.text = String(sai)
        
    }
    
    func setRandom() {
        countTimer = 5
        timer.invalidate()
        
        let random1 = Int(arc4random_uniform(10)) + 1
        let random2 = Int(arc4random_uniform(10)) + 1
        dau = Int(arc4random_uniform(3))
        
        
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        if(dau == 0){
            lbl_dau.text = "+"
        }else if( dau == 1){
            lbl_dau.text = "-"
        }else if(dau == 2){
            lbl_dau.text = "x"
        }
        
        setResult(random1, randomB: random2)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(ViewController.Counter), userInfo: nil, repeats: true)
        
                          
    
    }
    
    func Counter() {
        if(countTimer == 0){
            
            
            sai += 1
            lbl_wrong.text = String(sai)
            setRandom()
        }
        countTimer -= 1
        lbl_timer.text = String(countTimer)
        
        
        
    }
    
    func setResult(randomA: Int,randomB: Int){
        var ngaunhien = Int(arc4random_uniform(3))
        kq = tinh_kq(randomA,p2:randomB)
        print("int ket qua : \(kq)")
        var khoang1 = 0
        var khoang2 = 0
        var khoang = kq
        var daodau = Int(arc4random_uniform(2));
        if(daodau == 0) {
            daodau = 1
        }else{
            daodau = -1
        }
        print("dao dau : \(daodau)")
//        if(kq < 0){
//            
//            khoang1 = Int(arc4random_uniform(UInt32(-kq!))) * daodau
//            khoang = -kq!
//            
//        }else{
//            khoang1 = Int(arc4random_uniform(UInt32(kq!))) * daodau
//        }
//        khoang2 = (Int(arc4random_uniform(UInt32(khoang!))) + Int(khoang!)+1) * daodau
        if(kq < 0){
            khoang = -kq!
        }
        
        khoang1 = Int(arc4random_uniform(UInt32(khoang!))) * daodau
        while(khoang1 == kq){
            khoang1 = Int(arc4random_uniform(UInt32(khoang!))) * daodau
        }
        khoang2 = (Int(arc4random_uniform(UInt32(khoang!))) + Int(khoang!)+1) * daodau
        
        print("khoang : khoang \(khoang) :  \(khoang1) : \(khoang2)")
        
        if(ngaunhien == 0){
            btn_1.setTitle(String(kq!), forState: .Normal)
            btn_2.setTitle(String(khoang1), forState: .Normal)
            btn_3.setTitle(String(khoang2), forState: .Normal)

        }else if(ngaunhien == 1){
            btn_2.setTitle(String(kq!), forState: .Normal)
            btn_1.setTitle(String(khoang1), forState: .Normal)
            btn_3.setTitle(String(khoang2), forState: .Normal)

            
        }else{
            btn_3.setTitle(String(kq!), forState: .Normal)
            btn_2.setTitle(String(khoang1), forState: .Normal)
            btn_1.setTitle(String(khoang2), forState: .Normal)

            
        }
        
        number_1 = Int(btn_1.currentTitle!)
        number_2 = Int(btn_2.currentTitle!)
        number_3 = Int(btn_3.currentTitle!)
        
        
    }
    func tinh_kq(p1: Int, p2: Int) ->Int{
        print("int dau \(dau)")
        if(dau == 0){
            return p1 + p2
        }else if(dau == 1){
            return p1 - p2
        }else {
            return p1 * p2
        }
    }

}

