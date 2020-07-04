//
//  ViewController.swift
//  PokeDB
//
//  Created by Willem Marda on 7/1/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//


import UIKit

class ViewController: UIViewController {


    @IBOutlet var PokemonButtons:[UIButton]!
    @IBOutlet weak var PokeImageViewer: UIImageView!
    @IBOutlet weak var BackButton: UIButton!

    
    var KantoPokedex = KantoDex();
    var PokeImage: UIImage = #imageLiteral(resourceName: "bulbasaur");
    var PokeName: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.

      
        for i in PokemonButtons{
            print(i.titleLabel)
        }
        // Create the Kanto Pokedex with the first 151 pokemon.
        KantoPokedex.CreateKantoDex();
        
        
    }
    
    @IBAction func PokemonButtons_Clicked(_ sender: Any){
        
        switch PokemonButtons.firstIndex(of: sender as! UIButton){

        case 0:
            PokeImage = KantoPokedex.GetImage(Index: 0);
            PokeName = KantoPokedex.GetName(Index: 0);
            
            performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            //HpSlider.value = KantoPokedex.GetHp(Index: 0);
            break;

        case 1:
            PokeImage = KantoPokedex.GetImage(Index: 1);
            PokeName = KantoPokedex.GetName(Index: 1);
             performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;

        case 2:
            PokeImage = KantoPokedex.GetImage(Index: 2);
            PokeName = KantoPokedex.GetName(Index: 2);
            performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;

        case 3:
            PokeImage = KantoPokedex.GetImage(Index: 3);
            PokeName = KantoPokedex.GetName(Index: 3);
            performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;

        case 4:
            PokeImage = KantoPokedex.GetImage(Index: 4);
            PokeName = KantoPokedex.GetName(Index: 4);
            performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;

        case 5:
            PokeImage = KantoPokedex.GetImage(Index: 5);
            PokeName = KantoPokedex.GetName(Index: 5);
             performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;

        case 6:
            PokeImage = KantoPokedex.GetImage(Index: 6);
            PokeName = KantoPokedex.GetName(Index: 6);
             performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;

        case 7:
            PokeImage = KantoPokedex.GetImage(Index: 7);
            PokeName = KantoPokedex.GetName(Index: 7);
             performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;

        case 8:
            PokeImage = KantoPokedex.GetImage(Index: 8);
            PokeName = KantoPokedex.GetName(Index: 8);
             performSegue(withIdentifier: "InfoSegue", sender: self)
            print(PokeName)
            break;



        default:
            print("No data on this Pokemon has been collected. :(")
            PokeName = "?????";
        }

        

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier != "HomeSegue"{
            let controller = segue.destination as! InformationViewController;
            controller.MyName = PokeName;
            controller.MyImage = PokeImage;
        }

    }


}

