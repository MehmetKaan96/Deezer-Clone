//
//  LandingViewController.swift
//  Deezer-Clone
//
//  Created by Mehmet Kaan on 14.05.2023.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var seconds = 3
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waitAndChangeLabel()
        
    }
    
    
    func waitAndChangeLabel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                UIView.transition(with: self.welcomeLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                    self.welcomeLabel.text = "Binlerce Müzik Burada"
                }, completion: { _ in
                    // Label değiştirme animasyonu tamamlandıktan 3 saniye sonra segue yapılacak olan DispatchQueue
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.performSegue(withIdentifier: "toGenres", sender: nil)
                    }
                })
            }
    }

}
