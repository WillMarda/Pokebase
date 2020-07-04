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
    
}
