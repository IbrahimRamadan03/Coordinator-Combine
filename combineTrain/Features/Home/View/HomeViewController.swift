//
//  HomeViewController.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    var coordinator : HomeCoordinator!
    @IBOutlet weak var topView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
  
    }
    
    
    func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        topView.addVerticalGradient(topColor: UIColor.init(hex: "E6E6E6").withAlphaComponent(0), bottomColor: UIColor.init(hex: "FEFFBF").withAlphaComponent(1))
        topView.applyCornerRadius(40, corners: [.bottomLeft , .bottomRight])
        
    }
    
    
    
  


    @IBAction func POP(_ sender: Any) {
        print("pushScreen scree")
        coordinator.showTestScrren()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
