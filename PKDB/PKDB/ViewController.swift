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
    
//    @IBAction func AddToCloud(_ sender: Any) {
//
//        Firestore.firestore().collection("PokeDex").document("Raichu").setData([
//            "name": "Raichu",
//            "specie": "Mouse Pokemon",
//            "dexNum": "025",
//            "dexEntry": "Pikachu that can generate powerful electricity have cheek sacs that are extra soft and super stretchy. When Pikachu meet, they’ll touch their tails together and exchange electricity through them as a form of greeting.",
//            "typeOne": "Electric",
//            "typeTwo": "",
//            "ability": "Static",
//            "hiddenAbility": "Lightning Rod",
//            "image": "pikachu",
//            "hp": 35,
//            "attack": 55,
//            "defense": 40,
//            "speed": 90,
//            "sp_def": 50,
//            "sp_att": 50,
//            "evolution": "raichu",
//            "evolutionTwo": "",
//            "preEvoOne": "",
//            "preEvoTwo": "",
//            "eggGroup": "Fairy, Field",
//            "eggCycle": 10,
//            "eggCycleSteps": "2,314–2,570 steps",
//            "maleGenderRatio": 50,
//            "femaleGenderRatio": 50,
//
//        ]) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//    }
    
    
}

