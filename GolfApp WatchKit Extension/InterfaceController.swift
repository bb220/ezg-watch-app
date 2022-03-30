//
//  InterfaceController.swift
//  GolfApp WatchKit Extension
//
//  Created by Waseem Ali on 22/03/2022.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {
    var stroke = 0
    var put = 0
    var total = 0
    @IBOutlet weak var totalLabel: WKInterfaceLabel!
    @IBOutlet weak var strokeLabel: WKInterfaceLabel!
    @IBOutlet weak var putLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        if let text = UserDefaults.standard.string(forKey: "stroke"){
           // print("got stroke "+text)
            strokeLabel.setText(text)
            stroke =  Int(text) ?? 0
            
        }
        if let text = UserDefaults.standard.string(forKey: "put"){
            //print("got putt "+text)
            putLabel.setText(text)
            put =  Int(text) ?? 0
        }
        if let text = UserDefaults.standard.string(forKey: "total"){
            //print("got total "+text)
            totalLabel.setText(text)
            total =  Int(text) ?? 0
        }

       
    
                        
                                
       }
    func setPut(val :Int){
        if(val<=0){
            putLabel.setText("-")
            UserDefaults.standard.set("-", forKey: "put") //setObject

        }else{
           
            putLabel.setText("\(val)")
            UserDefaults.standard.set("\(val)", forKey: "put") //setObject
        }
        
    }
    func setStroke(val :Int){
        if(val<=0){
            strokeLabel.setText("-")
            UserDefaults.standard.set("-", forKey: "stroke") //setObject
        }else{
            strokeLabel.setText("\(val)")
            UserDefaults.standard.set("\(val)", forKey: "stroke") //setObject
        }
        
    }
    func setTotal(val :Int){
        if(val<=0){
            totalLabel.setText("-")
            UserDefaults.standard.set("-", forKey: "total") //setObject
        }else{
            totalLabel.setText("\(val)")
            UserDefaults.standard.set("\(val)", forKey: "total") //setObject
        }
        
    }
    @IBAction func puttLongPush(_ sender: Any) {
        //print("lng putt")
        let v = sender as! WKLongPressGestureRecognizer
        if v.state == .began {
            if(put > 0){
                put = put - 1
            }
           
            setPut(val: put)
            total = put + stroke
            setTotal(val: total)
        }
        
        
    }
    
    @IBAction func storeLongPush(_ sender: Any) {
        //print("long storke")
        let v = sender as! WKLongPressGestureRecognizer
        if v.state == .began {
            if(stroke > 0){
                stroke = stroke - 1
            }

            setStroke(val: stroke)
            total = put + stroke
            setTotal(val: total)
        }
        
        
    }
  
    @IBAction func puttClicked() {
        //print("putt")
        put = put + 1
        setPut(val: put)
        total = put + stroke
        setTotal(val: total)
    }
    
    @IBAction func strokeClicked() {
        //print("stroke")
        stroke = stroke + 1
        setStroke(val: stroke)
        total = put + stroke
        setTotal(val: total)
        
    }
    @IBAction func swiped(_ sender: Any) {
        put = 0
        stroke = 0
        total = 0
        setPut(val: put)
        setTotal(val: total)
        setStroke(val: total)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
