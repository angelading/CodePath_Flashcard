//
//  CreationViewController.swift
//  Flashcard App
//
//  Created by Yi Ding on 3/6/21.
//

import UIKit

class CreationViewController: UIViewController {
   
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    var initiaQuestion: String?
    var initialAnswer: String?
    @IBOutlet weak var extraAnswer1: UITextField!
    @IBOutlet weak var extraAnswer2: UITextField!
    var initialExtraAnswer1: String?
    var initialExtraAnswer2: String?
    
    var flashcardsController: ViewController!//have the flashcardsController property you can actually call updateFlashcard() on it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionTextField.text = initiaQuestion
        answerTextField.text = initialAnswer
        extraAnswer1.text = initialExtraAnswer1
        extraAnswer2.text = initialExtraAnswer2
    }
    
    @IBAction func didTapOnCancle(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText =  questionTextField.text
        let answerText = answerTextField.text
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty {
            let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
            present(alert, animated: true)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        } else {
            var isExisting = false
            if initiaQuestion != nil {
                isExisting = true
            }
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerOne: extraAnswer1.text!, extraAnswerTwo: extraAnswer2.text!, isExisting: isExisting)
          dismiss(animated: true)
        }
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
