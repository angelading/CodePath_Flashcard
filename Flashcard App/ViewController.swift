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
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.layer.cornerRadius = 20.0;
        //view.clipsToBounds = true;
        answerLable.layer.cornerRadius = 20.0
        questionLabel.layer.cornerRadius = 20.0
        
        cardView.layer.shadowRadius = 15.0
        cardView.layer.shadowOpacity = 0.2
        
        questionLabel.clipsToBounds = true
        answerLable.clipsToBounds = true
        
        button1.layer.borderWidth = 3.0
        button1.layer.cornerRadius = 20.0
        button1.layer.borderColor = #colorLiteral(red: 0.6816284657, green: 0.6982917786, blue: 1, alpha: 1)
        
        button2.layer.borderWidth = 3.0
        button2.layer.cornerRadius = 20.0
        button2.layer.borderColor = #colorLiteral(red: 0.6816284657, green: 0.6982917786, blue: 1, alpha: 1)
        
        button3.layer.borderWidth = 3.0
        button3.layer.cornerRadius = 20.0
        button3.layer.borderColor = #colorLiteral(red: 0.6816284657, green: 0.6982917786, blue: 1, alpha: 1)
    }

//    @IBAction func didTapOnFlashcard(_ sender: Any) {
//        if questionLabel.isHidden == false {
//            questionLabel.isHidden = true
//            answerLable.isHidden = false
//        } else if questionLabel.isHidden == true {
//            questionLabel.isHidden = false
//            answerLable.isHidden = true
//        }
//
//    }
   
    @IBAction func didTapButton1(_ sender: Any) {
        button1.isHidden = true;
    }
    
    @IBAction func didTapButton2(_ sender: Any) {
        button2.isHidden = true;
    }
    
    @IBAction func didtapButton3(_ sender: Any) {
        questionLabel.isHidden = true
        answerLable.isHidden = false
    }
    
}

