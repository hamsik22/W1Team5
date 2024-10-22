//
//  ViewController.swift
//  W1Team5
//
//  Created by 황석현 on 10/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hamsikButtonTapped(_ sender: UIButton) {
        
        print("Hamsik Button tapped")
        let storyboard = UIStoryboard(name: "HamsikView", bundle: nil)
        if let secondViewController = storyboard.instantiateViewController(withIdentifier: "HamsikViewController") as? HamsikViewController {
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}
