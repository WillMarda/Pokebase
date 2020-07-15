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

        Firestore.firestore().collection("PokeDex").document("Arcanine").setData([
            "name": "Arcanine",
            "specie": "Legendary Pokemon",
            "dexNum": "059",
            "dexEntry": "Arcanine 22is a legendary Pokémon in the East. A Pokémon that has long been admired for its beauty, it runs agilely as if on wings. The sight of it running over 6,200 miles in a single day and night has captivated many people.",
            "image": "arcanine",
            "typeOne": "Fire",
            "typeTwo": "",
            "ability": "Intimidate / Flash Fire",
            "hiddenAbility": "Justified",
            "hp": 90,
            "attack": 110,
            "defense": 80,
            "sp_att": 100,
            "sp_def": 80,
            "speed": 95,
            "evolution": "",
            "evolutionTwo": "",
            "preEvoOne": "growlithe",
            "preEvoTwo": "",
            "eggGroup": "Field",
            "eggCycle": 20,
            "eggCycleSteps": "4,884–5,140 steps",
            "maleGenderRatio": 75,
            "femaleGenderRatio": 25,
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

