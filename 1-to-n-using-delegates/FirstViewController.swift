//
//  ViewController.swift
//  1-to-n-using-delegates
//
//  Created by Samet Koyuncu on 13.10.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    weak var manager = ManagerClass.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager?.addDelegate(self)
    }
    @IBAction func goSecondVC(_ sender: UIButton) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    @IBAction func runManegerButtonPressed(_ sender: UIButton) {
        manager?.didLoad()
    }
}

extension FirstViewController: ManagerClassProtocol {
    func didRun() {
        print("First VC")
    }
}

