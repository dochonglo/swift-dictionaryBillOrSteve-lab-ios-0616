//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveOutlet: UIButton!
    @IBOutlet weak var billOutlet: UIButton!
    
    // You should probably create an instance variable to store your random facts. You're storing 4-5 facts for two different people, Bill and Steve. What type of variable do you think you should create?
    var triviaDictionary = [String : [String]]()
    
    // Instance variables, so we can later check if a correct guess has been made.
    var currentRandomPerson : String = ""
    var currentRandomFact : String = ""

    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        showFact()
    }
    
    // The dictionary instance variable you created to store the facts should probably have two keys, "Bill Gates" and "Steve Jobs", which correspond to the strings returned by randomPerson(). Each key should be assigned an array containing the facts about each person.
    func createFacts() {
        
        triviaDictionary["Steve Jobs"] = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        triviaDictionary["Bill Gates"] = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
    }
    
    func getRandomFact() -> (person: String, fact: String)? {
        
        // Returns either the String "Bill Gates" or "Steve Jobs", which also corresonds to keys in the triviaDictionary.
        let personKey = randomPerson()
        
        let factsAboutEachPerson = triviaDictionary[personKey]
        
        var fact : String = ""
        
        // Checks whether keys are not present in the dictionary:
        if let validFacts = factsAboutEachPerson {
            
            // Randomly selects a key from the dictionary of facts, then randomly selects a fact from the array associated with that key.
            fact = validFacts[randomNumberFromZeroTo(validFacts.count)]
            
        }
        
        return(personKey, fact)
    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    // Should get a random fact and person using the method you wrote, then change the text in the middle of the UI to the text of that fact.
    func showFact() {
        
        currentRandomPerson = (getRandomFact()?.person)!
        
        currentRandomFact = (getRandomFact()?.fact)!
        
        self.factLabel.text = currentRandomFact
        
    }
    
    // When a user presses a button, your logic should check to see if the button pressed is the correct guess.
    @IBAction func steveButtonDidTouch(sender: AnyObject) {
        
        //  If the guess is correct, you should increment the counter at the top of the screen.
        if currentRandomPerson == "Steve Jobs" {

            counter = counter + 1
            scoreLabel.text = "\(counter)"
            //showFact()
            
        }
        showFact()
        
    }
    
    // When a user presses a button, your logic should check to see if the button pressed is the correct guess.
    @IBAction func billButtonDidTouch(sender: AnyObject) {
        
        //  If the guess is correct, you should increment the counter at the top of the screen.
        if currentRandomPerson == "Bill Gates" {
            
            counter = counter + 1
            scoreLabel.text = "\(counter)"
            //showFact()
        
        }
        showFact()
    }
}
