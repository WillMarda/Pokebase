//
//  KantoDex.swift
//  PokeDB
//
//  Created by Willem Marda on 7/3/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import Foundation
import UIKit

class KantoDex{
    
    var KantoPokedex: [Pokemon] = [];
    
    public func CreateKantoDex(){
        
        let Bulbasaur = Pokemon();
        Bulbasaur.NewPokemon(newIndex: "001", newName: "Bulbasaur", newImage: #imageLiteral(resourceName: "bulbasaur"), newHp: 45, newAttack: 49, newDefense: 49, newSpeed: 45, newSp_Def: 65, newSp_Att: 65);
        KantoPokedex.append(Bulbasaur);
        
        let Ivysaur = Pokemon();
        Ivysaur.NewPokemon(newIndex: "002", newName: "Ivysaur", newImage: #imageLiteral(resourceName: "ivysaur"), newHp: 60, newAttack: 62, newDefense: 63, newSpeed: 60, newSp_Def: 80, newSp_Att: 80);
        KantoPokedex.append(Ivysaur);
        
        let Venasaur = Pokemon();
        Venasaur.NewPokemon(newIndex: "003", newName: "Ivysaur", newImage: #imageLiteral(resourceName: "venusaur"), newHp: 80, newAttack: 82, newDefense: 83, newSpeed: 80, newSp_Def: 100, newSp_Att: 100);
        KantoPokedex.append(Venasaur);
        
        let Charmander = Pokemon();
        Charmander.NewPokemon(newIndex: "004", newName: "Charmander", newImage: #imageLiteral(resourceName: "charmander"), newHp: 39, newAttack: 52, newDefense: 43, newSpeed: 65, newSp_Def: 50, newSp_Att: 60);
        KantoPokedex.append(Charmander);
        
        let Charmeleon = Pokemon();
        Charmeleon.NewPokemon(newIndex: "005", newName: "Charmeleon", newImage: #imageLiteral(resourceName: "charmeleon"), newHp: 58, newAttack: 64, newDefense: 58, newSpeed: 80, newSp_Def: 65, newSp_Att: 80);
        KantoPokedex.append(Charmeleon);
        
        let Charizard = Pokemon();
        Charizard.NewPokemon(newIndex: "006", newName: "Charizard", newImage: #imageLiteral(resourceName: "charizard"), newHp: 78, newAttack: 84, newDefense: 78, newSpeed: 100, newSp_Def: 85, newSp_Att: 109);
        KantoPokedex.append(Charizard);
        
        let Squirtle = Pokemon();
        Squirtle.NewPokemon(newIndex: "007", newName: "Squirtle", newImage: #imageLiteral(resourceName: "squirtle"), newHp: 44, newAttack: 48, newDefense: 65, newSpeed: 43, newSp_Def: 64, newSp_Att: 50);
        KantoPokedex.append(Squirtle);
        
        let Wartortle = Pokemon();
        Wartortle.NewPokemon(newIndex: "008", newName: "Wartortle", newImage: #imageLiteral(resourceName: "wartortle"), newHp: 59, newAttack: 63, newDefense: 80, newSpeed: 58, newSp_Def: 80, newSp_Att: 65);
        KantoPokedex.append(Wartortle);
        
        let Blastoise = Pokemon();
        Blastoise.NewPokemon(newIndex: "009", newName: "Blastoise", newImage: #imageLiteral(resourceName: "blastoise"), newHp: 79, newAttack: 83, newDefense: 100, newSpeed: 78, newSp_Def: 105, newSp_Att: 85);
        KantoPokedex.append(Blastoise);
        

    }
    
    public func GetIndex(Index: Int) -> Int{
        
        return KantoPokedex.index(after: Index-1);
    }
    
    public func GetName(Index: Int) -> String{
        
        let thisMon = KantoPokedex[Index];
        return thisMon.Name;
    }
    
    public func GetImage(Index: Int) -> UIImage{
        
        let thisMon = KantoPokedex[Index];
        return thisMon.Image;
    }
    
    public func GetHp(Index: Int) -> Float{
        
        let thisMon = KantoPokedex[Index];
        return thisMon.Hp;
    }
    
    public func GetAttack(Index: Int) -> Float{
        
        let thisMon = KantoPokedex[Index];
        return thisMon.Attack;
    }
    
    
}
