//
//  ResultViewController.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 07.11.2020.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var pictureResult: UIImageView!
    @IBOutlet var shortInfoLabel: UILabel!
    
    @IBOutlet var producerLabel: UILabel!
    @IBOutlet var administratorLabel: UILabel!
    @IBOutlet var entrepreneurLabel: UILabel!
    @IBOutlet var integratorLabel: UILabel!
    
    @IBOutlet var characteristicLabel: UILabel!
    
    var rawTestResult: Answer!
//    var calculatedTestResult: String = ""
    var calculatedTestResult = Result()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureResult.layer.cornerRadius = 15
        
        
        // = calulateResultTest(rawTestResult: rawTestResult)
        
//        characteristicLabel.text = Result.getResult(text: calculatedTestResult).characteristic
        
    }
    
    
    // MARK: - функции для рачета
    /*
     private func pCalulateResultTest(rawTestResult: Answer) -> String {
     identifyFrom(characters: ["P", "p"], and: rawTestResult.producer)
     }
     
     private func aCalulateResultTest(rawTestResult: Answer) -> String {
     identifyFrom(characters: ["A", "a"], and: rawTestResult.producer)
     }
     
     private func eCalulateResultTest(rawTestResult: Answer) -> String {
     identifyFrom(characters: ["E", "e"], and: rawTestResult.entrepreneur)
     }
     
     private func iCalulateResultTest(rawTestResult: Answer) -> String {
     identifyFrom(characters: ["I", "i"], and: rawTestResult.integrator)
     }
     
     */
    private func calulateResultTest(rawTestResult: Answer) -> String {
        var result = ""
        
        result += identifyFrom(characters: ["P", "p"], and: rawTestResult.producer)
        result += identifyFrom(characters: ["A", "a"], and: rawTestResult.administrator)
        result += identifyFrom(characters: ["E", "e"], and: rawTestResult.entrepreneur)
        result += identifyFrom(characters: ["I", "i"], and: rawTestResult.integrator)
        
        return result
    }
    
    private func toString(from array: [String]) -> String {
        var resultString = ""
        for character in array {
            resultString += character
        }
        return resultString
    }
    
    
    
    
    
    
    private func identifyFrom(characters: [String], and number: Int) -> String {
        var result = ""
        
        guard characters.count == 2 else {
            return "😱"
        }
        switch number {
        case 30...:
            result = characters.first ?? "😱"
        case 20..<30:
            result = characters.last ?? "😱"
        default:
            result =  "-"
        }
        
        return result
    }
    
    //    var producer: Int
    //    var administrator: Int
    //    var entrepreneur: Int
    //    var integrator: Int
    
    
    //    enum PaelCaracters {
    //        case producer, administrator, entrepreneur
    //
    //
    //        enum produserValue: String {
    //            case largeP = "P"
    //            case smoleP = "p"
    //            case dash = "-"
    //        }
}












//    var producer: Int
//    var administrator: Int
//    var entrepreneur: Int
//    var integrator: Int


//больше 20 и меньше 30 это маленькая буква, больше или равно 30 это большая

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


