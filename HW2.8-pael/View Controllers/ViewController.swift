//
//  ViewController.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//

import UIKit
import KDCircularProgress

struct Answer {
    var producer: Int
    var administrator: Int
    var entrepreneur: Int
    var integrator: Int
}

class ViewController: UIViewController {

    @IBOutlet var producerButtons: [UIButton]!
    @IBOutlet var administratorButtons: [UIButton]!
    @IBOutlet var entrepreneurButtons: [UIButton]!
    @IBOutlet var integratorButtons: [UIButton]!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    @IBOutlet var producerLabel: UILabel!
    @IBOutlet var administratorLabel: UILabel!
    @IBOutlet var entrepreneurLabel: UILabel!
    @IBOutlet var integratorLabel: UILabel!
    
    @IBOutlet var resultLable: UILabel!
    // убрать new
    @IBOutlet var newResultLabel: UILabel!
    
    @IBOutlet var blockProgressView: UIProgressView!
    
    @IBOutlet var circularProgressView: KDCircularProgress!
    
    private var result = 0
    private var blocks = Block.getBlocks()
    
    private var blockIndex = 0
    private var answer = Answer(producer: 0,
                                administrator: 0,
                                entrepreneur: 0,
                                integrator: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLable.text = String(result)
        let currentBlock = blocks[result]
        // TODO вынести куда-то
        producerLabel.text = currentBlock.qualityProducer
        administratorLabel.text = currentBlock.qualityAdministrator
        entrepreneurLabel.text = currentBlock.qualityEntrepreneurs
        integratorLabel.text = currentBlock.qualityIntegrator
        
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
        
        doneButton.isHidden = true
        // TODO убрать копипасту
        title = "Блок № \(blockIndex + 1) из \(blocks.count)"
        // calculate progress
        let totalProgress = Float(blockIndex) / Float(blocks.count)
        
        // set progress for progressView
        blockProgressView.setProgress(totalProgress, animated: true)
        
        
        newResultLabel.text = "\(result)\\10"
    }
    

    @IBAction func pressedButton(_ sender: UIButton) {
        if producerButtons.contains(sender) {
            setupIsSelected(for: producerButtons, and: sender)
        } else if administratorButtons.contains(sender) {
            setupIsSelected(for: administratorButtons, and: sender)
        } else if entrepreneurButtons.contains(sender) {
            setupIsSelected(for: entrepreneurButtons, and: sender)
        } else {
            setupIsSelected(for: integratorButtons, and: sender)
        }
        
    
        // Подумать как лищний раз не дергать переменную
        
        let currentButton: UIButton = blockIndex == blocks.count - 1 ? doneButton : nextButton
        
        if result == 10 {
            currentButton.isUserInteractionEnabled = true
            currentButton.alpha = 1
        } else {
            currentButton.isUserInteractionEnabled = false
            currentButton.alpha = 0.5
        }
        // TODO и снова убрать копипасту
        circularProgressView.animate(toAngle: calcNewAngle(),
                                     duration: 0.5,
                                     completion: nil)
        // жуть убрать копипасту
        newResultLabel.text = "\(result)\\10"
    }
    // TODO добавить если не выбран один из элементов, то кнопку делать не активную
    
    @IBAction func pressedNextButton(_ sender: UIButton) {
        if blockIndex >= blocks.count {
            // TODO переделать
            return
        }
        
        blockIndex += 1
        
        // TODO а верно ли это?
        if blockIndex == blocks.count - 1 {
            nextButton.isHidden = true
            doneButton.isHidden = false
        }
        
        // TODO вынести копипасту
        let currentBlock = blocks[blockIndex]
        producerLabel.text = currentBlock.qualityProducer
        administratorLabel.text = currentBlock.qualityAdministrator
        entrepreneurLabel.text = currentBlock.qualityEntrepreneurs
        integratorLabel.text = currentBlock.qualityIntegrator
        
        let producerCount = producerButtons.first(where: { $0.isSelected })?.tag
        let administratorCount = administratorButtons.first(where: { $0.isSelected })?.tag
        let entrepreneurCount = entrepreneurButtons.first(where: { $0.isSelected })?.tag
        let integratorCount = integratorButtons.first(where: { $0.isSelected })?.tag
        
        
        answer.producer += producerCount ?? 0
        answer.administrator += administratorCount ?? 0
        answer.entrepreneur += entrepreneurCount ?? 0
        answer.integrator += integratorCount ?? 0
        
        producerButtons.forEach() {
            $0.isSelected = false
        }
        administratorButtons.forEach() {
            $0.isSelected = false
        }
        entrepreneurButtons.forEach() {
            $0.isSelected = false
        }
        integratorButtons.forEach() {
            $0.isSelected = false
        }
        
        // ВОзможно result не нужен
        result = 0
        resultLable.text = String(result)
        
        title = "Блок № \(blockIndex + 1) из \(blocks.count)"
        
        // calculate progress
        let totalProgress = Float(blockIndex) / Float(blocks.count)
        
        // set progress for progressView
        blockProgressView.setProgress(totalProgress, animated: true)
        
        circularProgressView.animate(
            fromAngle: circularProgressView.angle,
            toAngle: 0,
            duration: 0.5,
            completion: nil
        )
        // жуть убрать копипасту
        newResultLabel.text = "\(result)\\10"
    }
    
    @IBAction func pressedDoneButton(_ sender: UIButton) {
        // TODO передать ответ на другой экран
        let producerCount = producerButtons.first(where: { $0.isSelected })?.tag
        let administratorCount = administratorButtons.first(where: { $0.isSelected })?.tag
        let entrepreneurCount = entrepreneurButtons.first(where: { $0.isSelected })?.tag
        let integratorCount = integratorButtons.first(where: { $0.isSelected })?.tag
        
        
        answer.producer += producerCount ?? 0
        answer.administrator += administratorCount ?? 0
        answer.entrepreneur += entrepreneurCount ?? 0
        answer.integrator += integratorCount ?? 0
        
        
        print(answer)
    }
    
    private func setupIsSelected(for buttons: [UIButton], and sender: UIButton) {
        if sender.isSelected {
            return
        }
        // TODO вынести куда-нибудь
        if let previousSelectedButton = buttons.first(where: { $0.isSelected }) {
            result -= previousSelectedButton.tag
            previousSelectedButton.isSelected = false
        }
        
        result += sender.tag
        resultLable.text = String(result)
        
        
        sender.isSelected = true
    }
    
    private func calcNewAngle() -> Double {
        // TODO переделать
        let currentResutl = result > 10 ? 10 : Double(result)
        
        
        return 360 * (currentResutl / 10.0)
    }
    
}

