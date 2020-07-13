//
//  ViewController.swift
//  PokeDB
//
//  Created by Willem Marda on 7/1/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//


import UIKit

class PokedexViewController: UIViewController {


    @IBOutlet weak var BackButton: UIButton!
    
    var MyName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        print("Pokedex View has been initialized")
        
    }

    
    @IBAction func PokemonButtons_Clicked(_ sender: UIButton){
        
        sender.isSelected = !sender.isSelected
        MyName = (sender.titleLabel?.text)!

        performSegue(withIdentifier: "InfoSegue", sender: self)
        //print("Sending information to info view")
        

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "InfoSegue"{
            // we define a variable so that we can access the data in the view controller that we are trying to send stuff too.
            let controller = segue.destination as? InformationViewController;
            
            controller?.PokemonImageViewer?.image = nil
            controller!.myName = MyName

        }

    }

    @IBAction func ItemTabButton(_ sender: Any) {
        performSegue(withIdentifier: "ItemTabSegue", sender: self)
    }
    
    deinit{
        
        MyName = nil
        print("The Pokedex view has been de-initialized")
    }
    


}

