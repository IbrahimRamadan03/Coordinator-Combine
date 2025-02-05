//
//  HomeViewController.swift
//  combineTrain
//
//  Created by Apple on 31/01/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    var coordinator : HomeCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {

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
