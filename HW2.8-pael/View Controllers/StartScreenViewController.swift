//
//  ViewController.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//

import UIKit

class StartScreenViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var imagesColectionView: UICollectionView!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesColectionView.delegate = self
        imagesColectionView.dataSource = self
        
        startButton.layer.cornerRadius = 10
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! ManagementStyleCell
        cell.configure(indexPath: indexPath)
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 9, height: collectionView.frame.width / 3)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
}


