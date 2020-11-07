//
//  ViewController.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//

import UIKit
import KDCircularProgress

// TODO убрать структуру
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
    
    @IBOutlet var pointsLabel: UILabel!
    
    @IBOutlet var blockProgressView: UIProgressView!
    @IBOutlet var circularProgressView: KDCircularProgress!
    
    private let blocks = Block.getBlocks()
    private let maxPoints = 10
    
    private var currenPoints = 0
    private var blockIndex = 0
    
    private var answer = Answer(producer: 0,
                                administrator: 0,
                                entrepreneur: 0,
                                integrator: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupSwitchButtons()
        setupTitle()
        setupBlockProgressView()
    }
    
    @IBAction func pressedCharacteristicButton(_ sender: UIButton) {
        if !sender.isSelected {
            let buttons = getSelectedButtonCharacteristics(sender: sender)
            
            if let previousSelectedButton = buttons.first(where:
                                                            { $0.isSelected }) {
                previousSelectedButton.isSelected = false
                currenPoints -= previousSelectedButton.tag
            }
            
            sender.isSelected = true
            currenPoints += sender.tag
        }
    
        toggleAvailabilityForSwitchButton()
        animateCircularProgressView()
        pointsLabel.text = getPoints()
    }
    
    @IBAction func pressedNextButton(_ sender: UIButton) {
        fillAnswer()
        prepareForNextBlock()
    }
    
    @IBAction func pressedDoneButton(_ sender: UIButton) {
        fillAnswer()
        
        // TODO передать ответ на другой экран
        print(answer)
    }
    
    private func prepareForNextBlock() {
        blockIndex += 1
        if blockIndex == blocks.count - 1 {
            nextButton.isHidden = true
            doneButton.isHidden = false
        }
        
        currenPoints = 0
        setupLabels()
        resetSelectedInСharacteristicButtons()
        setupTitle()
        setupBlockProgressView()
        clearCircularProgressView()
        pointsLabel.text = getPoints()
    }
}

extension ViewController {
    
    private func setupLabels() {
        let currentBlock = blocks[blockIndex]
    
        producerLabel.text = currentBlock.qualityProducer
        administratorLabel.text = currentBlock.qualityAdministrator
        entrepreneurLabel.text = currentBlock.qualityEntrepreneurs
        integratorLabel.text = currentBlock.qualityIntegrator
        
        pointsLabel.text = getPoints()
    }
    
    private func setupBlockProgressView() {
        let totalProgress = Float(blockIndex) / Float(blocks.count)
        blockProgressView.setProgress(totalProgress, animated: true)
    }
    
    private func setupTitle() {
        title = "Блок № \(blockIndex + 1) из \(blocks.count)"
    }
    
    private func setupSwitchButtons() {
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
        
        doneButton.isHidden = true
    }
    
}

extension ViewController {
    
    private func getPoints() -> String {
        return "\(currenPoints)\\\(maxPoints)"
    }
    
    private func fillAnswer() {
        answer.producer += getСharacteristicPoint(for: producerButtons)
        answer.administrator += getСharacteristicPoint(for: administratorButtons)
        answer.entrepreneur += getСharacteristicPoint(for: entrepreneurButtons)
        answer.integrator += getСharacteristicPoint(for: integratorButtons)
    }
    
    private func getСharacteristicPoint(for buttons: [UIButton]) -> Int {
        buttons.first(where: { $0.isSelected })?.tag ?? 0
    }
    
    private func resetSelectedInСharacteristicButtons() {
        [producerButtons, administratorButtons,
         entrepreneurButtons, integratorButtons].forEach() {
            $0?.forEach() {
                $0.isSelected = false
            }
        }
    }
    
    private func toggleAvailabilityForSwitchButton() {
        let button: UIButton = blockIndex == blocks.count - 1
            ? doneButton : nextButton
        
        if currenPoints == maxPoints {
            button.isUserInteractionEnabled = true
            button.alpha = 1
        } else {
            button.isUserInteractionEnabled = false
            button.alpha = 0.5
        }
    }
    
    private func getSelectedButtonCharacteristics(sender: UIButton) -> [UIButton] {
        if producerButtons.contains(sender) {
            return producerButtons
        }
        if administratorButtons.contains(sender) {
            return administratorButtons
        }
        if entrepreneurButtons.contains(sender) {
            return entrepreneurButtons
        }
        return integratorButtons
    }
    
}

extension ViewController {
    private func clearCircularProgressView() {
        circularProgressView.animate(fromAngle: circularProgressView.angle,
                                     toAngle: 0,
                                     duration: 0.5,
                                     completion: nil
        )
    }
    
    private func animateCircularProgressView() {
        let angle = getAngle()
        circularProgressView.animate(toAngle: angle,
                                     duration: 0.5,
                                     completion: nil)
    }
    
    private func getAngle() -> Double {
        let points = currenPoints > maxPoints ? maxPoints : currenPoints
        return 360 * (Double(points) / Double(maxPoints))
    }
}
