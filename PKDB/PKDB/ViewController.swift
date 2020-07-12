//
//  ViewController.swift
//  PKDB
//
//  Created by Willem Marda on 7/10/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Firestore.firestore().enableNetwork(){ (Error) in
            print("Network enabled. Getting data.")
        }
        
    }

    @IBAction func GoToPokedex(_ sender: Any) {
        performSegue(withIdentifier: "HomeSegue", sender: self)
    }
    
    @IBAction func GoToTabbedPokedex(_ sender: Any) {
        performSegue(withIdentifier: "HomeSegueTabbed", sender: self)
    }
    
    @IBAction func AddToCloud(_ sender: Any) {

        Firestore.firestore().collection("PokeDex").document("Golbat").setData([
            "name": "Golbat",
            "specie": "Bat Pokemon",
            "dexNum": "042",
            "dexEntry": "Golbat attacks in a stealthy manner, without warning. Its sharp fangs are used to bite and to suck blood. Once it bites, it will not stop draining energy from the victim even if it gets too heavy to fly.",
            "image": "golbat",
            "typeOne": "Poison",
            "typeTwo": "Flying",
            "ability": "Inner Focus",
            "hiddenAbility": "Inflitrator",
            "hp": 75,
            "attack": 80,
            "defense": 70,
            "speed": 90,
            "sp_def": 65,
            "sp_att": 75,
            "evolution": "",
            "evolutionTwo": "",
            "preEvoOne": "zubat",
            "preEvoTwo": "",
            "eggGroup": "Flying",
            "eggCycle": 15,
            "eggCycleSteps": "3,599–3,855 steps",
            "maleGenderRatio": 50,
            "femaleGenderRatio": 50,
            "xpToLevel": 0,
            "itemToLevel": ""

        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    
}

