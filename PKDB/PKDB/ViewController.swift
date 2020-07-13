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

        Firestore.firestore().collection("PokeDex").document("Diglett").setData([
            "name": "Diglett",
            "specie": "Mole Pokemon",
            "dexNum": "050",
            "dexEntry": "Diglett burrows through the ground at a shallow depth. It leaves raised earth in its wake, making it easy to spot. If it digs through a field, it leaves the soil perfectly tilled and ideal for planting crops. ",
            "image": "diglett",
            "typeOne": "Ground",
            "typeTwo": "",
            "ability": "Sand Veil",
            "hiddenAbility": "Sand Force",
            "hp": 10,
            "attack": 55,
            "defense": 25,
            "sp_att": 35,
            "sp_def": 45,
            "speed": 95,
            "evolution": "dugtrio",
            "evolutionTwo": "",
            "preEvoOne": "",
            "preEvoTwo": "",
            "eggGroup": "Field",
            "eggCycle": 20,
            "eggCycleSteps": "4,884–5,140 steps",
            "maleGenderRatio": 50,
            "femaleGenderRatio": 50,
            "xpToLevel": 26,
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

