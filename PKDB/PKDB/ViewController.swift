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
    
    @IBAction func AddToCloud(_ sender: Any) {

        Firestore.firestore().collection("PokeDex").document("Ninetales").setData([
            "name": "Ninetales",
            "specie": "Fox Pokemon",
            "dexNum": "038",
            "dexEntry": "Very smart and very vengeful, Ninetales is said to live 1,000 years, and each of its tails is loaded with supernatural powers. According to an enduring legend, nine noble saints were united and reincarnated as this Pokémon.",
            "typeOne": "Fire",
            "typeTwo": "",
            "ability": "Flash Fire",
            "hiddenAbility": "Drought",
            "image": "ninetales",
            "hp": 73,
            "attack": 76,
            "defense": 75,
            "speed": 100,
            "sp_def": 81,
            "sp_att": 100,
            "evolution": "",
            "evolutionTwo": "",
            "preEvoOne": "vulpix",
            "preEvoTwo": "",
            "eggGroup": "Field",
            "eggCycle": 20,
            "eggCycleSteps": "4,884–5,140 steps",
            "maleGenderRatio": 25,
            "femaleGenderRatio": 75,
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

