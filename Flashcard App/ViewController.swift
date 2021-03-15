//
//  ViewController.swift
//  Flashcard App
//
//  Created by Yi Ding on 2/13/21.
//
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
    var extraAnswer1: String
    var extraAnswer2: String
}
class ViewController: UIViewController {

    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //array to hold flashcards
    var flashcards = [Flashcard]()
    //current flashcard index
    var currentIndex = 0
    var didAddQuestion = false
    
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
        
        //read from saved flashcards
        readSavedFlashcards()
        //if nothing then add initial card
        if flashcards.count == 0 {
            updateFlashcard(question: "How many degrees can cats rotate their ears?", answer: "180 Degrees", extraAnswerOne: "45 Degrees", extraAnswerTwo: "90 Degrees", isExisting: true)
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
    }

      @IBAction func didTapOnFlashcard(_ sender: Any) {
          if questionLabel.isHidden == false {
              questionLabel.isHidden = true
              answerLable.isHidden = false
          } else if questionLabel.isHidden == true {
              questionLabel.isHidden = false
              answerLable.isHidden = true
          }
      }
    

    @IBAction func plusQuestion(_ sender: Any) {
        performSegue(withIdentifier: "addQuestion", sender: self)
        didAddQuestion = true
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
            creationController.flashcardsController = self
        if segue.identifier == "changeQuestion" {
            creationController.initiaQuestion = questionLabel.text
            creationController.initialAnswer = answerLable.text
            creationController.initialExtraAnswer1 = button1.title(for: .normal)
            creationController.initialExtraAnswer2 = button2.title(for: .normal)
        }
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String?, extraAnswerTwo: String?, isExisting: Bool){
        //creating a flashcard object
        let flashcard = Flashcard(question: question, answer: answer, extraAnswer1: extraAnswerOne!, extraAnswer2: extraAnswerTwo!)
        if isExisting {
            flashcards[currentIndex] = flashcard
            print("🥳 Edited flashcard")
        } else {
        //if didAddQuestion == true {
        //adding flashcards into the array
        flashcards.append(flashcard)
        resetButtons()
        //logging to the console
        print("🥳 Added new flashcard")
        print("😎 We now have \(flashcards.count) flashcards!")
        
        //updating current index
        currentIndex = flashcards.count - 1
        print("😃 Our current index is \(currentIndex)")
        }
        //update labels
        updateLabels()
            
//        didAddQuestion = false
//        } else {
//            if flashcards.count == 0 {
//                flashcards.append(flashcard)
//            }
//            //editing existing card
//            questionLabel.text = question
//            answerLable.text = answer
//            button1.setTitle(flashcard.extraAnswer1, for: .normal)
//            button2.setTitle(flashcard.extraAnswer2, for: .normal)
//            button3.setTitle(flashcard.answer, for: .normal)
//            resetButtons()
//            print("🥳 Edited flashcard")
//        }
        //update next&prev buttons
        updateNextPrevButtons()
    }
    
    func updateNextPrevButtons() {
        //disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
            prevButton.isHidden = true
        } else {
            prevButton.isEnabled = true
            prevButton.isHidden = false
        }
        
        //disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
            nextButton.isHidden = true
        } else {
            nextButton.isEnabled = true
            nextButton.isHidden = false
        }
    }
   
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        questionLabel.text = currentFlashcard.question
        answerLable.text = currentFlashcard.answer
        button1.setTitle(currentFlashcard.extraAnswer1, for: .normal)
        button2.setTitle(currentFlashcard.extraAnswer2, for: .normal)
        button3.setTitle(currentFlashcard.answer, for: .normal)
    }
    
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
    
    func resetButtons() {
        if questionLabel.isHidden == true {
            questionLabel.isHidden = false
            answerLable.isHidden = true
        }
        button1.isHidden = false;
        button2.isHidden = false;
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        resetButtons()
        //increase current index
        currentIndex = currentIndex - 1
        //update labels
        updateLabels()
        //update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        resetButtons()
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    func saveAllFlashcardsToDisk() {
        //convert array of Flashcard to dictionaries
        let dictionaryArray = flashcards.map{(card) -> [String: String] in return ["question": card.question, "answer": card.answer, "extraAnswer1" :card.extraAnswer1, "extraAnswer2" :card.extraAnswer2]
        }
        //save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        //log to console
        print("🎉 Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        //read the dictionary array from disk if any
        //if let statement allows us to define a constant, in this case dictionaryArray, if and only if there's a value returned by UserDefaults. expecting dictionaryArray to be an array of dictionaries where both the keys and values are Strings. Then we can use that constant inside the if curly brackets
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String : String]] {
            //convert an array of dictionaries to an array of Flashcards
            let savedCards = dictionaryArray.map{ dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, extraAnswer1: dictionary["extraAnswer1"]!, extraAnswer2: dictionary["extraAnswer2"]!) //We need the ! to tell Swift that we're 100% sure that the dictionary has a value there for "question" and for "answer".
            }
            //put the flashcards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    @IBAction func didTapDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        present(alert, animated: true)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            self.deleteCurrentFlashcard()
        }
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
    }
    
    func deleteCurrentFlashcard(){
        //special card: delete the only card
        if flashcards.count == 1 {
            let alert = UIAlertController(title: "Delete Last Flashcard", message: "You only have one card left. You can edit this card instead of deleting it.", preferredStyle: .alert)
            present(alert, animated: true)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        } else {
            flashcards.remove(at: currentIndex)
            //special case: delete last card
            if currentIndex > flashcards.count - 1 {
                currentIndex = flashcards.count - 1
            }
            updateNextPrevButtons()
            updateLabels()
            saveAllFlashcardsToDisk()
        }
    }
    //More features needed:
    //shuffle the answers every time
    //shuffle the card, jump to the beginning to restart, jump to the end.
    //add card in the middle
    //save previous multiple choice actions
}

