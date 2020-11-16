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
//    @IBOutlet var characteristicLabel: UILabel!
    
    @IBOutlet var characteristicTextView: UITextView!
    
    @IBOutlet var paelLabels: [UILabel]!
    
    var rawTestResult: Answer!
//    var rawTestResult = Answer(producer: 40, administrator: 4, entrepreneur: 56, integrator: 2)
    var paelKey = ""
    var result: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureResult.layer.cornerRadius = 15
        
        paelKey = calulateResultTest(from: rawTestResult)
        result = Result.getResult(text: paelKey)
        
        shortInfoLabel.text = result?.shortInfo
        characteristicTextView.text = result?.characteristic
        pictureResult.image = UIImage(named: result?.picture ?? "default")
        setPaelLabels(from: paelKey)
        
        navigationItem.title = result?.shortInfo
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        
    }
    
    // MARK: - Установка значений в лейблы
    private func setPaelLabels(from result: String) {
        paelLabels.forEach { (label) in
            
            label.text = getСharacter(number: label.tag, from: result)
            
            switch label.tag {
            case 0:
                label.text? += ": \(rawTestResult.producer)"
            case 1:
                label.text? += ": \(rawTestResult.administrator)"
            case 2:
                label.text? += ": \(rawTestResult.entrepreneur)"
            default:
                label.text? += ": \(rawTestResult.integrator)"
            }
        }
    }
    //MARK: - Расчет ключа paei
    private func calulateResultTest(from: Answer) -> String {
        var result = ""
        
        result += identifyFrom(characters: ["P", "p"], and: rawTestResult.producer)
        result += identifyFrom(characters: ["A", "a"], and: rawTestResult.administrator)
        result += identifyFrom(characters: ["E", "e"], and: rawTestResult.entrepreneur)
        result += identifyFrom(characters: ["I", "i"], and: rawTestResult.integrator)
        
        return result
    }
    
    //MARK: - Логика определения буквы для ключа pael
    private func identifyFrom(characters: [String], and number: Int) -> String {
        var result = ""
        
        assert(characters.count == 2, "Передан неверный массив")
        
        switch number {
        case 30...:
            result = characters.first ?? "😱"
        case 20..<30:
            result = characters.last ?? "😱"
        default:
            result = "-"
        }
        
        return result
    }
}
    //MARK: - Вытаскиваем нужный символ из строки
    private func getСharacter(number: Int, from string: String) -> String {
        let index = string.index(string.startIndex, offsetBy: number)
        return String(string[index])
    }

