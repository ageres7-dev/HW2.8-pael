//
//  ViewController.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//

import UIKit

class StartScreenViewController: UIViewController {

   
    @IBOutlet var firstMainPicture: UIImageView!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstMainPicture.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 10
        
        firstMainPicture.image = UIImage(named: "First screen")

    }


}

