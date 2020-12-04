//
//  ViewController.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//

import UIKit

class StartScreenViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

//    @IBOutlet var firstMainPicture: UIImageView!
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
        cell.styleImageView.layer.cornerRadius = 10
        cell.styleImageView.image = UIImage(named: "\(indexPath.row)")
        cell.styleLabel.text = nil
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height/1.5, height: collectionView.frame.height)
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
}


