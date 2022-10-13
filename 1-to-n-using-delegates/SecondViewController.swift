//
//  SecondViewController.swift
//  1-to-n-using-delegates
//
//  Created by Samet Koyuncu on 13.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var manager = ManagerClass.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        manager?.addDelegate(self)
        
    }

    @IBAction func runMangerButtonPressed(_ sender: UIButton) {
        manager?.didLoad()
    }
    @IBAction func removeFromDelegatesButtonPressed(_ sender: UIButton) {
        manager?.removeDelegate(self)
    }
}

extension SecondViewController: ManagerClassProtocol {
    func didRun() {
        print("Second VC")
    }
}
