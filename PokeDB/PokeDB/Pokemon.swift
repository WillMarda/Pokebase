//
//  Pokemon.swift
//  PokeDB
//
//  Created by Willem Marda on 7/3/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import Foundation
import UIKit

class Pokemon{
    
    var Index = "001";
    var Name = "";
    var Image = #imageLiteral(resourceName: "Empty");
    var TypeOneImage = #imageLiteral(resourceName: "Empty");
    var TypeTwoImage = #imageLiteral(resourceName: "Empty");
    
    // Now we will add in the base stats of the pokemon!
    var Level: Int = 0;
    var Hp: Float = 0;
    var Attack: Float = 0.0;
    var Defense: Float = 0.0;
    var Speed: Float = 0.0;
    var Sp_Def: Float = 0.0;
    var Sp_Att: Float = 0.0;
    var Ability: String = "";
    var HiddenAbility: String = "";
    var Evolution: Pokemon!;
    var HasOnePreEvo: Bool = false;
    var HasTwoPreEvos: Bool = false;
    var PreEvolutionOne: Pokemon!;
    var PreEvolutionTwo: Pokemon!;
    
    // Breeding stuff
    var EggGroup: String = "";
    var EggCycle: Int = 0;
    var EggCycleSteps: String = "";
    var GenderRatioMale: Double = 0;
    var GenderRatioFemale: Double = 0;

    
    
    public func NewPokemon(newIndex: String, newName: String, newImage: UIImage, newFirstTypeImage: UIImage, newSecondTypeImage: UIImage, newHp: Float, newAttack: Float, newDefense: Float, newSpeed: Float, newSp_Def: Float, newSp_Att: Float, newAbility: String, newHiddenAbility: String, newEggGroup: String, newMaleGenderRatio: Double, newFemaleGenderRatio: Double, newEggCycle: Int, newEggCycleSteps: String){
        
        // Main Values
        Index = newIndex;
        Name = newName;
        Image = newImage;
        TypeOneImage = newFirstTypeImage;
        TypeTwoImage = newSecondTypeImage;
        
        // Base Stats
        Hp = newHp;
        Attack = newAttack;
        Defense = newDefense;
        Speed = newSpeed;
        Sp_Def = newSp_Def;
        Sp_Att = newSp_Att;
        
        // Abilities
        Ability = newAbility;
        HiddenAbility = newHiddenAbility;
        
        // Breeding
        EggGroup = newEggGroup;
        GenderRatioMale = newMaleGenderRatio;
        GenderRatioFemale = newFemaleGenderRatio;
        EggCycle = newEggCycle;
        EggCycleSteps = newEggCycleSteps;
        
    }
    
    public func GetName() -> String{
        return Name;
    }
    
    public func GetImage() -> UIImage{
        return Image;
    }
    
    public func NewEvolution(nextEvolution: Pokemon, nextLevel: Int){
        Evolution = nextEvolution;
        Level = nextLevel;
    }

    public func GetEvolution() -> Pokemon{
        return Evolution!;
    }
    
    
    public func HasEvolution() -> Bool{
        
        if Evolution != nil{
            return true;
        }
        else{
            return false;
        }
        
    }
    
    public func setHasOnePreEvolution(hasEvo: Bool){
        HasOnePreEvo = hasEvo;
    }

    public func setHasTwoPreEvolutions(hasEvos: Bool){
        HasTwoPreEvos = hasEvos;
    }
    
    public func HasOnePreEvolution() -> Bool{
        return HasOnePreEvo;
    }

    public func HasTwoPreEvolutions() -> Bool{
        return HasTwoPreEvos;
    }
    


    
}
