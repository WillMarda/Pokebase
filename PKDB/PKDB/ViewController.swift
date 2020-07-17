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

        Firestore.firestore().collection("PokeDex").document("Alakazam").setData([
            "name": "Alakazam",
            "specie": "Psi Pokemon",
            "dexNum": "065",
            "dexEntry": "Alakazam is a Pokémon that can memorize anything. It never forgets what it learns. That’s why this Pokémon is so smart. Alakazam uses its psychic powers to make the spoons it carries. Each spoon is an original that there’s only one of in the whole world. If it trusts someone deeply, it will let them have one of its spoons. Anything you eat with that spoon is apparently delicious.",
            
            "image": "alakazam",
            "typeOne": "Psychic",
            "typeTwo": "",
            "ability": "Synchronize / Inner Focus",
            "hiddenAbility": "Magic Gaurd",
            "hp": 55,
            "attack": 50,
            "defense": 45,
            "sp_att": 135,
            "sp_def": 95,
            "speed": 120,
            "evolution": "",
            "evolutionTwo": "",
            "preEvoOne": "abra",
            "preEvoTwo": "kadabra",
            "eggGroup": "Human-Like",
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

