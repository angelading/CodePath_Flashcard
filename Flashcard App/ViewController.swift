//
//  ViewController.swift
//  Flashcard App
//
//  Created by Yi Ding on 2/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        questionLabel.isHidden = true;
    }
    
}

