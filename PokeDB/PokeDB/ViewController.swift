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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.

      
//        for i in PokemonButtons{
//            print(i.titleLabel ?? "")
//        }
        // Create the Kanto Pokedex with the first 151 pokemon.
        KantoPokedex.CreateKantoDex();

        
    }
    
    @IBAction func PokemonButtons_Clicked(_ sender: Any){
        
        
//
//        if InformationView.isHidden == true{
//
//            InformationView.isHidden = false;
//        }
//        else{
//            InformationView.isHidden = true;
//        }
//
//        switch PokemonButtons.firstIndex(of: sender as! UIButton){
//
//        case 0:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 0);
//            PokeName.text = KantoPokedex.GetName(Index: 0);
//            HpSlider.value = KantoPokedex.GetHp(Index: 0);
//            break;
//
//        case 1:
//        PokeImageViewer.image = KantoPokedex.GetImage(Index: 1);
//        PokeName.text = KantoPokedex.GetName(Index: 1);
//            break;
//
//        case 2:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 2);
//            PokeName.text = KantoPokedex.GetName(Index: 2);
//            break;
//
//        case 3:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 3);
//            PokeName.text = KantoPokedex.GetName(Index: 3);
//            break;
//
//        case 4:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 4);
//            PokeName.text = KantoPokedex.GetName(Index: 4);
//            break;
//
//        case 5:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 5);
//            PokeName.text = KantoPokedex.GetName(Index: 5);
//            break;
//
//        case 6:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 6);
//            PokeName.text = KantoPokedex.GetName(Index: 6);
//            break;
//
//        case 7:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 7);
//            PokeName.text = KantoPokedex.GetName(Index: 7);
//            break;
//
//        case 8:
//            PokeImageViewer.image = KantoPokedex.GetImage(Index: 8);
//            PokeName.text = KantoPokedex.GetName(Index: 8);
//            break;
//
//
//
//        default:
//            print("No data on this Pokemon has been collected. :(")
//            PokeName.text = "?????";
//        }
//
//


    }

//    @IBAction func PokeViewBackButton_Clicked(_ sender: Any) {
//
//        PokemonListView.isHidden = true;
//
//    }


}

