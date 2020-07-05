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

    
    var NewPokedex = Pokedex();
    var MyMon: Pokemon!;
    var PokeImage: UIImage = #imageLiteral(resourceName: "bulbasaur");
    var PokeName: String = "";
    var BaseHp: Float = 0.0;
    var BaseAttack: Float = 0.0;
    var BaseDefense: Float = 0.0;
    var BaseSpeed: Float = 0.0;
    var BaseSpe_Def: Float = 0.0;
    var BaseSpe_Att: Float = 0.0;
    var Evolution: Pokemon?;
    var PreEvolutionOne: Pokemon?;
    var PreEvolutionTwo: Pokemon?;
    var Level: Int?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.

      
        for i in PokemonButtons{
            print(i.titleLabel)
        }
        // Create the Kanto Pokedex with the first 151 pokemon.
        NewPokedex.CreatePokedex();
        
        
    }
    
    @IBAction func PokemonButtons_Clicked(_ sender: Any){
        
        // we use a switch statement here to send over specific information. We may need to create a function for this instead.
        
        let MyIndex = PokemonButtons.firstIndex(of: sender as! UIButton);
        
        if MyIndex != nil{
            GetPokemonInfo(MyIndex: MyIndex!)
        }
        else{
            print("No data on this Pokemon has been collected. :(")
        }

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // we first do a check to see what segue we are passing variables through.
        if segue.identifier != "HomeSegue"{
            
            // we define a variable so that we can access the data in the view controller that we are trying to send stuff too.
            let controller = segue.destination as! InformationViewController;
            
            // here we now send over the data to the next view controller
            controller.MyName = PokeName;
            controller.MyImage = PokeImage;
            controller.MyBaseHp = BaseHp;
            controller.MyBaseAttack = BaseAttack;
            controller.MyBaseDefense = BaseDefense;
            controller.MyBaseSpeed = BaseSpeed;
            controller.MyBaseSpe_Def = BaseSpe_Def;
            controller.MyBaseSpe_Att = BaseSpe_Att;
            
            // First we get the current pokemon and check to see if it has an evolution.
            if MyMon.HasEvolution() == true{
                controller.EvolutionImage = Evolution?.GetImage();
                
                // then, we check to see if that evolution also has an evolution
                if MyMon.Evolution!.HasEvolution() == true{
                    
                    controller.SecondEvolutionImage = Evolution?.GetEvolution().GetImage();
                }
                else // if it doesnt, we check to see if the current pokemon has a pre-evolution.
                if MyMon.HasOnePreEvolution() == true{
                    controller.FirstPreEvolutionImage = PreEvolutionOne?.GetImage();
                }
            }
            else // if the current Pokemon does not have one pre-evolution, but instead has two pre-evolutions
            if MyMon.HasTwoPreEvolutions() == true{
                controller.FirstPreEvolutionImage = PreEvolutionOne?.GetImage();
                controller.SecondPreEvolutionImage = PreEvolutionTwo?.GetImage();
            }
            
            
        }else{
            // we clear out all the information so that we can clear up some memory.
            PokemonButtons.removeAll();
            NewPokedex.ClearDex();
            PokeImage = #imageLiteral(resourceName: "bulbasaur");
            PokeName = "";
            BaseHp = 0.0;
            BaseAttack = 0.0;
            BaseDefense = 0.0;
            
        }
    }

    
    private func GetPokemonInfo(MyIndex: Int){
        
        // First we get the current pokemon
        MyMon = NewPokedex.GetPokemon(Index: MyIndex)
        
        // Then we get all its values!
        PokeImage = MyMon.Image;
        PokeName = MyMon.Name;
        BaseHp = MyMon.Hp;
        BaseAttack = MyMon.Attack;
        BaseDefense = MyMon.Defense;
        BaseSpeed = MyMon.Speed;
        BaseSpe_Def = MyMon.Sp_Def;
        BaseSpe_Att = MyMon.Sp_Att;
        

        // First we check to see if the current pokemon has an evolution
        if MyMon.HasEvolution() == true{
            Evolution = MyMon.Evolution;
            
            // Then, we check to see if the current pokemon has a pre-evolution
            if MyMon.HasOnePreEvolution() == true{
                PreEvolutionOne = MyMon.PreEvolutionOne;
            }
            
            print("This pokemon has an Evolution");
            
        }
        else // if the pokemon does not have an evolution, we check to see if it maybe has two pre-evolutions instead.
        if MyMon.HasEvolution() == false && MyMon.HasTwoPreEvolutions() == true{
            PreEvolutionOne = MyMon.PreEvolutionOne;
            PreEvolutionTwo = MyMon.PreEvolutionTwo;
        }
            

        


        
        Level = NewPokedex.GetEvolutionLevel(Index: MyIndex);
        
        performSegue(withIdentifier: "InfoSegue", sender: self)
         
         
     }
    
    

}

