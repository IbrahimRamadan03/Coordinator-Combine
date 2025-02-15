//
//  HomeViewController.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    var coordinator : HomeCoordinator!
    @IBOutlet weak var topView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
  
    }
    
    func setupUI() {
        collection.dataSource = self
        collection.delegate = self
        let nib = UINib(nibName: "MyCell", bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: "myCell")
        self.navigationController?.navigationBar.isHidden = true
        topView.addVerticalGradient(topColor: UIColor.init(hex: "E6E6E6").withAlphaComponent(0), bottomColor: UIColor.init(hex: "FEFFBF").withAlphaComponent(1))
        topView.applyCornerRadius(40, corners: [.bottomLeft , .bottomRight])
        
    }
    
    @IBAction func POP(_ sender: Any) {
        coordinator.showTestScrren()
    }


}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCell
        cell.isSelected = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCell
        cell.isSelected = false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = (collectionView.frame.width - 20) / 3
        let height = collectionView.frame.height
           return CGSize(width: width, height: height)
       }
    

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
    
    
}
