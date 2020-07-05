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
    
    
    
    // These are the variables that we can pass information to.
    var MyImage = #imageLiteral(resourceName: "Kanto");
    var MyName = "";
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
    
    // And here in this override function, we can load the new values of our variables.
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        PokemonNameLabel.text = MyName;
        PokemonImageViewer.image = MyImage;
        
        // here we put the stuff for the Base Stats of the pokemon.
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

    
    
    
}
