//
//  InformationViewController.swift
//  PokeDB
//
//  Created by Willem Marda on 7/3/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {


    @IBOutlet weak var PokemonNameLabel: UILabel!
    @IBOutlet weak var PokemonImageViewer: UIImageView!
    
    @IBOutlet weak var SingleTypeViewer: UIImageView!
    @IBOutlet weak var FirstTypeViewer: UIImageView!
    
    @IBOutlet weak var SecondTypeViewer: UIImageView!
    
    @IBOutlet weak var SingleTypeLabel: UILabel!
    @IBOutlet weak var FirstTypeLabel: UILabel!
    @IBOutlet weak var SecondTypeLabel: UILabel!
    
    //Base Stats of the Pokemon
    @IBOutlet weak var BaseHpSlider: UISlider!
    @IBOutlet weak var BaseHpLabel: UILabel!
    
    @IBOutlet weak var BaseAttackSlider: UISlider!
    @IBOutlet weak var BaseAttackLabel: UILabel!
    
    @IBOutlet weak var BaseDefenseSlider: UISlider!
    @IBOutlet weak var BaseDefenseLabel: UILabel!
    
    @IBOutlet weak var BaseSpeedSlider: UISlider!
    @IBOutlet weak var BaseSpeedLabel: UILabel!
    
    @IBOutlet weak var BaseSpDefenseSlider: UISlider!
    @IBOutlet weak var BaseSpDefenseLabel: UILabel!
    
    @IBOutlet weak var BaseSpAttackSlider: UISlider!
    @IBOutlet weak var BaseSpAttackLabel: UILabel!
    
    
    @IBOutlet weak var FirstEvolutionViewer: UIImageView!
    @IBOutlet weak var SecondEvolutionViewer: UIImageView!
    
    @IBOutlet weak var AbilityLabel: UILabel!
    @IBOutlet weak var HiddenAbilityLabel: UILabel!
    
    @IBOutlet weak var GenderRatioLabel: UILabel!
    @IBOutlet weak var EggGroupLabel: UILabel!
    @IBOutlet weak var EggCycleLabel: UILabel!
    
    // These are the variables that we can pass information to.
    var MyImage = #imageLiteral(resourceName: "Empty");
    var MyName = "";
    var MyFirstType = #imageLiteral(resourceName: "Empty");
    var MySecondType = #imageLiteral(resourceName: "Empty");
    var FirstType: String!;
    var SecondType: String!;
    
    var MyBaseHp:Float = 0.0;
    var MyBaseAttack:Float = 0.0;
    var MyBaseDefense:Float = 0.0;
    var MyBaseSpeed:Float = 0.0;
    var MyBaseSpe_Def:Float = 0.0;
    var MyBaseSpe_Att:Float = 0.0;
    
    var EvolutionImage: UIImage?;
    var SecondEvolutionImage: UIImage?
    var FirstPreEvolutionImage: UIImage?
    var SecondPreEvolutionImage: UIImage?
    
    var MyAbility: String = "";
    var MyHiddenAbility: String = "";
    
    var MyMaleGenderRatio: Double = 0.0;
    var MyFemaleGenderRatio: Double = 0.0;
    var MyEggGroup: String = "";
    var MyEggCycle: Int = 0;
    var MyEggCycleSteps: String = "";
    
    
    
    
    
    
    // And here in this override function, we can load the new values of our variables.
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        
        // Label and Main Image
        PokemonNameLabel.text = MyName;
        PokemonImageViewer.image = MyImage;
        
        // Base Stats
        BaseHpSlider.value = MyBaseHp;
        BaseHpLabel.text = String(MyBaseHp);
        BaseAttackSlider.value = MyBaseAttack;
        BaseAttackLabel.text = String(MyBaseAttack);
        BaseDefenseSlider.value = MyBaseDefense;
        BaseDefenseLabel.text = String(MyBaseDefense);
        BaseSpeedSlider.value = MyBaseSpeed;
        BaseSpeedLabel.text = String(MyBaseSpeed);
        BaseSpDefenseSlider.value = MyBaseSpe_Def;
        BaseSpDefenseLabel.text = String(MyBaseSpe_Def);
        BaseSpAttackSlider.value = MyBaseSpe_Att;
        BaseSpAttackLabel.text = String(MyBaseSpe_Att);
        
        // Ability
        AbilityLabel.text = MyAbility;
        HiddenAbilityLabel.text = MyHiddenAbility;
        
        // Breeding
        GenderRatioLabel.text = "M " + String(MyMaleGenderRatio) + "% / " + "F " + String(MyFemaleGenderRatio) + "%"
        EggGroupLabel.text = MyEggGroup;
        EggCycleLabel.text = String(MyEggCycle) + " ,(" + MyEggCycleSteps + ")";
        
        
        // First we check to see if we have an evolution image
        if EvolutionImage != nil{
            
            // we then set the first evolution image to the first viewer
            FirstEvolutionViewer.image = EvolutionImage;
            
            if SecondEvolutionImage != nil{
                SecondEvolutionViewer.image = SecondEvolutionImage;
            }
            else
            // then we check to see if we have a pre-evolution image
            if FirstPreEvolutionImage != nil {
                
                // if we do, then we switch the viewers. We put the evolution in the second and the pre-evolution in the first
                FirstEvolutionViewer.image = FirstPreEvolutionImage;
                SecondEvolutionViewer.image = EvolutionImage;
            }
        }
        else // if the Evolution image is empty
        if EvolutionImage == nil{
            
            if FirstPreEvolutionImage != nil && SecondPreEvolutionImage != nil{
                
                FirstEvolutionViewer.image = FirstPreEvolutionImage;
                SecondEvolutionViewer.image = SecondPreEvolutionImage;
                
            }
            
        }

        if MyFirstType != #imageLiteral(resourceName: "Empty"){
            
            if MySecondType != #imageLiteral(resourceName: "Empty"){
                FirstTypeViewer.image = MyFirstType;
                SecondTypeViewer.image = MySecondType;
                FirstTypeLabel.text = getTypeName(Image: MyFirstType);
                SecondTypeLabel.text = getTypeName(Image: MySecondType);
                
                SingleTypeLabel.text = "";
                
            }
            else{
                SingleTypeViewer.image = MyFirstType;
                SingleTypeLabel.text = getTypeName(Image: MyFirstType);
                
                FirstTypeLabel.text = "";
                SecondTypeLabel.text = "";
                
            }
            
        }
        
        //print(MyName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // we first do a check to see what segue we are passing variables through.
        if segue.identifier != "HomeSegue"{
            
            // we define a variable so that we can access the data in the view controller that we are trying to send stuff too.
            let controller = segue.destination as! ViewController;
            
            // here we now send over the data to the next view controller
            controller.PokeName = "";
            controller.PokeImage = #imageLiteral(resourceName: "Kanto");
            controller.BaseHp = 0.0;
            controller.BaseAttack = 0.0;
            
        }
    }

    public func getTypeName(Image: UIImage) -> String{
        
        switch Image{
            
        case #imageLiteral(resourceName: "Grass"):
            return "Grass"
            
            break;
        case #imageLiteral(resourceName: "Fire"):
            return "Fire"
            
            break;
        case #imageLiteral(resourceName: "Water"):
            return "Water"
            
            break;
        case #imageLiteral(resourceName: "Electric"):
            return "Electric"
            
            break;
        case #imageLiteral(resourceName: "Poison"):
            return "Poison"
            
            break;
        case #imageLiteral(resourceName: "Ice"):
            return "Ice"
            
            break;
        case #imageLiteral(resourceName: "Ghost"):
            return "Ghost"
            
            break;
        case #imageLiteral(resourceName: "Psychic"):
            return "Psychic"
            
            break;
        case #imageLiteral(resourceName: "Flying"):
            return "Flying"
            
            break;
        case #imageLiteral(resourceName: "Steel"):
            return "Steel"
            
            break;
        case #imageLiteral(resourceName: "Normal"):
            return "Normal"
            
            break;
        case #imageLiteral(resourceName: "Ground"):
            return "Ground"
            
            break;
        case #imageLiteral(resourceName: "Rock"):
            return "Rock"
            
            break;
        case #imageLiteral(resourceName: "Fighting"):
            return "Fighting"
            
            break;
        case #imageLiteral(resourceName: "Fairy"):
            return "Fairy"
            
            break;
        case #imageLiteral(resourceName: "Bug"):
            return "Bug"
            
            break;
        case #imageLiteral(resourceName: "Dark"):
            return "Dark"
            
            break;
            
        default:
            return "????"
        }
        
    }
    
    
}
