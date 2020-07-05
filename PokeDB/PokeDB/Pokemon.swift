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
    var Image = #imageLiteral(resourceName: "bulbasaur");
    
    // Now we will add in the base stats of the pokemon!
    var Hp: Float = 0;
    var Attack: Float = 0.0;
    var Defense: Float = 0.0;
    var Speed: Float = 0.0;
    var Sp_Def: Float = 0.0;
    var Sp_Att: Float = 0.0;
    var Evolution: Pokemon!;
    var HasOnePreEvo: Bool = false;
    var HasTwoPreEvos: Bool = false;
    var PreEvolutionOne: Pokemon!;
    var PreEvolutionTwo: Pokemon!;
    var Level: Int = 0;
    
    
    public func NewPokemon(newIndex: String, newName: String, newImage: UIImage, newHp: Float, newAttack: Float, newDefense: Float, newSpeed: Float, newSp_Def: Float, newSp_Att: Float){
        
        // Main Values
        Index = newIndex;
        Name = newName;
        Image = newImage;
        
        // Base Stats
        Hp = newHp;
        Attack = newAttack;
        Defense = newDefense;
        Speed = newSpeed;
        Sp_Def = newSp_Def;
        Sp_Att = newSp_Att;
        
        
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
