//
//  InformationViewController.swift
//  PokeDB
//
//  Created by Willem Marda on 7/3/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import UIKit
import Firebase

class InformationViewController: UIViewController {


    @IBOutlet weak var PokemonNameLabel: UILabel?
    @IBOutlet weak var PokemonImageViewer: UIImageView!
    
    @IBOutlet weak var SpecieLabel: UILabel?
    
    @IBOutlet weak var TypeLabel: UILabel?
    @IBOutlet weak var DexEntryLabel: UILabel?
    
    
    //Base Stats of the Pokemon
    @IBOutlet weak var BaseHpSlider: UISlider?
    @IBOutlet weak var BaseHpLabel: UILabel?
    
    @IBOutlet weak var BaseAttackSlider: UISlider?
    @IBOutlet weak var BaseAttackLabel: UILabel?
    
    @IBOutlet weak var BaseDefenseSlider: UISlider?
    @IBOutlet weak var BaseDefenseLabel: UILabel?
    
    @IBOutlet weak var BaseSpeedSlider: UISlider?
    @IBOutlet weak var BaseSpeedLabel: UILabel?
    
    @IBOutlet weak var BaseSpDefenseSlider: UISlider?
    @IBOutlet weak var BaseSpDefenseLabel: UILabel?
    
    @IBOutlet weak var BaseSpAttackSlider: UISlider?
    @IBOutlet weak var BaseSpAttackLabel: UILabel?
    
    
    @IBOutlet weak var FirstEvolutionViewer: UIImageView?
    @IBOutlet weak var SecondEvolutionViewer: UIImageView?
    
    @IBOutlet weak var AbilityLabel: UILabel?
    @IBOutlet weak var HiddenAbilityLabel: UILabel?
    
    @IBOutlet weak var GenderRatioLabel: UILabel?
    @IBOutlet weak var EggGroupLabel: UILabel?
    @IBOutlet weak var EggCycleLabel: UILabel?
    
    @IBOutlet weak var LevelorItemEvolutionLabel: UILabel!
    
    var myName: String?

    // And here in this override function, we can load the new values of our variables.
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        
        GetPokemonInfoFromFirestore(myName: myName!)

    } // end of View Did Load

    
    private func ShowInfo(){
        // Label and Main Image
//        PokemonNameLabel?.text = MyName!;
//        PokemonImageViewer?.image = UIImage.init(imageLiteralResourceName: MyImage!);
//        SpecieLabel?.text = MySpecie;
//        DexEntryLabel?.text = MyDexEntry;
//
//        // Base Stats
//        BaseHpSlider?.value = MyBaseHp!;
//        BaseHpLabel?.text = "\(MyBaseHp!)"
//        BaseAttackSlider?.value = MyBaseAttack!;
//        BaseAttackLabel?.text = "\(MyBaseAttack!)"
//        BaseDefenseSlider?.value = MyBaseDefense!;
//        BaseDefenseLabel?.text = "\(MyBaseDefense!)"
//        BaseSpeedSlider?.value = MyBaseSpeed!;
//        BaseSpeedLabel?.text = "\(MyBaseSpeed!)"
//        BaseSpDefenseSlider?.value = MyBaseSpe_Def!;
//        BaseSpDefenseLabel?.text = "\(MyBaseSpe_Def!)"
//        BaseSpAttackSlider?.value = MyBaseSpe_Att!;
//        BaseSpAttackLabel?.text = "\(MyBaseSpe_Att!)"
////
////        // Ability
//        AbilityLabel?.text = MyAbility;
//        HiddenAbilityLabel?.text = MyHiddenAbility;
////
////        // Breeding
//        GenderRatioLabel?.text = "M " + "\(MyMaleGenderRatio!)" + "% / " + "F " + "\(MyFemaleGenderRatio!)" + "%"
//        EggGroupLabel?.text = MyEggGroup;
//        EggCycleLabel?.text = "\(MyEggCycle!)" + " ,(" + MyEggCycleSteps! + ")";
//
//        
//        if MyFirstType != ""{
//          TypeLabel?.text = MyFirstType! + " Type"
//
//          if MySecondType != ""{
//              TypeLabel?.text = MyFirstType! + " / " + MySecondType! + " Type"
//          }
//
//        }
//
//        // First we check to see if we have an evolution image
//        if MyEvolutionImage != ""{
//
//          // we then set the first evolution image to the first viewer
//            FirstEvolutionViewer?.image = UIImage(named: MyEvolutionImage!)
//
//            if MySecondEvolutionImage != ""{
//              SecondEvolutionViewer?.image = UIImage(named: MySecondEvolutionImage!)
//            }
//            else
//            // then we check to see if we have a pre-evolution image
//            if MyFirstPreEvolutionImage != "" {
//
//              // if we do, then we switch the viewers. We put the evolution in the second and the pre-evolution in the first
//              FirstEvolutionViewer?.image = UIImage(named: MyFirstPreEvolutionImage!)
//              SecondEvolutionViewer?.image = UIImage(named: MyEvolutionImage!)
//            }
//
//        }
//        else // if the Evolution image is empty
//        if MyEvolutionImage == ""{
//
//          print("This pokemons evolution does not have an image")
//
//          if MyFirstPreEvolutionImage != "" && MySecondPreEvolutionImage != ""{
//
//              FirstEvolutionViewer?.image = UIImage(named: MyFirstPreEvolutionImage!)
//              SecondEvolutionViewer?.image = UIImage(named: MySecondPreEvolutionImage!)
//
//          }
//          else
//          if MyFirstPreEvolutionImage != "" && MySecondPreEvolutionImage == ""{
//              FirstEvolutionViewer?.image = UIImage(named: MyFirstPreEvolutionImage!)
//          }
//
//        }
//
//
//          

    }

    
    private func ClearData(){
        
        PokemonImageViewer = nil;
        FirstEvolutionViewer = nil;
        SecondEvolutionViewer = nil;
        PokemonNameLabel = nil
        SpecieLabel = nil
        TypeLabel = nil
        DexEntryLabel = nil
        //Base Stats of the Pokemon
        BaseHpSlider = nil
        BaseHpLabel = nil
        BaseAttackSlider = nil
        BaseAttackLabel = nil
        BaseDefenseSlider = nil
        BaseDefenseLabel = nil
        BaseSpeedSlider = nil
        BaseSpeedLabel = nil
        BaseSpDefenseSlider = nil
        BaseSpDefenseLabel = nil
        BaseSpAttackSlider = nil
        BaseSpAttackLabel = nil
        AbilityLabel = nil
        HiddenAbilityLabel = nil
        GenderRatioLabel = nil
        EggGroupLabel = nil
        EggCycleLabel = nil
        myName = nil
        
    }
    
    private func GetPokemonInfoFromFirestore(myName: String){
            
        Firestore.firestore().collection("PokeDex").document(myName).getDocument {[unowned self] (document, error) in
                
            if error == nil{
                
                Firestore.firestore().clearPersistence { (error) in
                    print("Firestore DB has been cleared of pending writes, etc.")
                }
                
                if document != nil && document!.exists {
                    
                // Here we will now get the info. Dont worry, this caches the info for later, hence the crazy spikes in memory. Any regular person will not need to worry about it.
                    var PokemonData = document!.data()
                    
                // First we get the name, image, dex entry, and specie of the pokemon!
                    
                //self.MyDexNum = PokemonData?["dexNum"] as? String
                    self.PokemonNameLabel?.text = PokemonData?["name"] as? String
                    let image = PokemonData?["image"] as? String
                    self.PokemonImageViewer?.image = UIImage.init(named: image!)
                    self.DexEntryLabel?.text = PokemonData?["dexEntry"] as? String
                    self.SpecieLabel?.text = PokemonData?["specie"] as? String
                    
                // Then we get the first and second typing, as well as the base stats!
                    let firstType = PokemonData?["typeOne"] as? String
                    var secType = PokemonData?["typeTwo"] as? String
                    
                    if secType == ""{ secType = nil }
                    
                    if firstType != nil && secType != nil{
                        self.TypeLabel?.text = firstType! + " / " + secType! + " Type"
                    }
                    else{
                        self.TypeLabel?.text = firstType! + " Type"
                    }
                    
                    // Sliders
                    self.BaseHpSlider?.value = (PokemonData?["hp"] as? Float)!
                    self.BaseAttackSlider?.value = (PokemonData?["attack"] as? Float)!
                    self.BaseDefenseSlider?.value = (PokemonData?["defense"] as? Float)!
                    self.BaseSpeedSlider?.value = (PokemonData?["speed"] as? Float)!
                    self.BaseSpDefenseSlider?.value = (PokemonData?["sp_def"] as? Float)!
                    self.BaseSpAttackSlider?.value = (PokemonData?["sp_att"] as? Float)!
                    
                    // Labels
                    self.BaseHpLabel?.text = "\(self.BaseHpSlider?.value ?? 0)"
                    self.BaseAttackLabel?.text = "\(self.BaseAttackSlider?.value ?? 0)"
                    self.BaseDefenseLabel?.text = "\(self.BaseDefenseSlider?.value ?? 0)"
                    self.BaseSpeedLabel?.text = "\(self.BaseSpeedSlider?.value ?? 0)"
                    self.BaseSpDefenseLabel?.text = "\(self.BaseSpDefenseSlider?.value ?? 0)"
                    self.BaseSpAttackLabel?.text = "\(self.BaseSpAttackSlider?.value ?? 0)"
                    
                // Then we get the information for the evolutions! We do some code here as well to make sure we are getting the correct ones.
                    var evolutionImage = PokemonData?["evolution"] as? String
                    var secondEvolutionImage = PokemonData?["evolutionTwo"] as? String
                    var preEvolutionOne = PokemonData?["preEvoOne"] as? String
                    var preEvolutionTwo = PokemonData?["preEvoTwo"] as? String
                    
                    if evolutionImage == ""{ evolutionImage = nil }
                    if secondEvolutionImage == ""{ secondEvolutionImage = nil }
                    if preEvolutionOne == ""{ preEvolutionOne = nil }
                    if preEvolutionTwo == ""{ preEvolutionTwo = nil }
                    
                    // if the pokemon has a first and secon evolution
                    if evolutionImage != nil && secondEvolutionImage != nil{
                        self.SecondEvolutionViewer?.image = UIImage.init(named: secondEvolutionImage!)
                        self.FirstEvolutionViewer?.image = UIImage.init(named: evolutionImage!)
                    }
                    else // if the pokemon has a first evolution and 1 pre evolution
                    if evolutionImage != nil && preEvolutionOne != nil{
                        self.FirstEvolutionViewer?.image = UIImage.init(named: preEvolutionOne!)
                        self.SecondEvolutionViewer?.image = UIImage.init(named: evolutionImage!)
                    }
                    else // if the pokemon has an evolution, but does not have a second evolution
                    if evolutionImage != nil && secondEvolutionImage == nil{
                        self.FirstEvolutionViewer?.image = UIImage.init(named: evolutionImage!)
                    }
                    // if the pokemon has no evolution and has 1 pre evolution
                    if evolutionImage == nil && preEvolutionOne != nil && preEvolutionTwo == nil{
                        self.FirstEvolutionViewer?.image = UIImage.init(named: preEvolutionOne!)
                    }
                    else // if the pokemon has two pre evolutions
                    if evolutionImage == nil && preEvolutionOne != nil && preEvolutionTwo != nil{
                        self.FirstEvolutionViewer?.image = UIImage.init(named: preEvolutionOne!)
                        self.SecondEvolutionViewer?.image = UIImage.init(named: preEvolutionTwo!)
                    }
                    
                // Then we get the information for the abilities and breeding info
                    self.AbilityLabel?.text = PokemonData?["ability"] as? String
                    self.HiddenAbilityLabel?.text = PokemonData?["hiddenAbility"] as? String

                    self.EggGroupLabel?.text = PokemonData?["eggGroup"] as? String
                    let cycle = PokemonData?["eggCycle"] as? Int
                    let steps = PokemonData?["eggCycleSteps"] as? String
                    self.EggCycleLabel?.text = "\(cycle!)" + " " + steps!
                    let maleRatio = PokemonData?["maleGenderRatio"] as? Double
                    let femaleRatio = PokemonData?["femaleGenderRatio"] as? Double
                    self.GenderRatioLabel?.text = "M \(maleRatio!)" + " / " + "F \(femaleRatio!)"
                    
                    let itemToLevel = PokemonData?["itemToLevel"] as? String
                    let neededLevel = PokemonData?["xpToLevel"] as? Int
                    
                    if neededLevel == 0 && itemToLevel != ""{
                        self.LevelorItemEvolutionLabel.text = "Needs " + itemToLevel! + " to evolve"
                    }
                    else
                    if neededLevel != 0 && itemToLevel == ""{
                        self.LevelorItemEvolutionLabel.text = "Needs " + "Level \(neededLevel!)" + " to evolve"
                    }
                    else
                    if neededLevel == 0 && itemToLevel == ""{
                        self.LevelorItemEvolutionLabel.text = "This pokemon does not evolve"
                    }
                    
                    
                // And finally, we clear the data just in case ;)
                    PokemonData = nil
                    
                } // end of document check
                else{
                    print("There was an error. Can not load data.")
                    
                }

            } // end of error check
            else{
                print("There was an error. Can not load data.")
            }
            
            
        } // end of closure to get pokemond from database
    }

      deinit{
        
        //ClearData()
        dismiss(animated:true, completion: nil)
        print("The info view has been de-initialized")
        
      }
    
}
