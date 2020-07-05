//
//  Pokedex.swift
//  PokeDB
//
//  Created by Willem Marda on 7/3/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import Foundation
import UIKit

class Pokedex{
    
    var Pokedex: [Pokemon] = [];
    
    
    public func GetIndex(Index: Int) -> Int{
        
        return Pokedex.index(after: Index-1);
    }
    
    public func GetPokemon(Index: Int) -> Pokemon{
        
        let thisMon = Pokedex[Index];
        return thisMon;
        
    }
    
    public func GetName(Index: Int) -> String{
        
        let thisMon = Pokedex[Index];
        return thisMon.Name;
    }
    
    public func GetImage(Index: Int) -> UIImage{
        
        let thisMon = Pokedex[Index];
        return thisMon.Image;
    }
    
    public func GetHp(Index: Int) -> Float{
        
        let thisMon = Pokedex[Index];
        return thisMon.Hp;
    }
    
    public func GetAttack(Index: Int) -> Float{
        
        let thisMon = Pokedex[Index];
        return thisMon.Attack;
    }
    
    public func GetDefense(Index: Int) -> Float{
        
        let thisMon = Pokedex[Index];
        return thisMon.Defense;
    }
    
    public func GetSpeed(Index: Int) -> Float{
        
        let thisMon = Pokedex[Index];
        return thisMon.Speed;
    }
    
    public func GetSp_Defense(Index: Int) -> Float{
        
        let thisMon = Pokedex[Index];
        return thisMon.Sp_Def;
    }
    
    public func GetSp_Attack(Index: Int) -> Float{
        
        let thisMon = Pokedex[Index];
        return thisMon.Sp_Att;
    }
    
    public func GetEvolution(Index: Int) -> Pokemon{
        
        let thisMon = Pokedex[Index];
        return thisMon.Evolution!;
        
    }
    
    public func GetFirstPreEvolution(Index: Int) -> Pokemon{
        let thisMon = Pokedex[Index];
        return thisMon.PreEvolutionOne!;
    }
    
    public func GetSecondPreEvolution(Index: Int) -> Pokemon{
        let thisMon = Pokedex[Index];
        return thisMon.PreEvolutionTwo!;
    }
    
    public func GetEvolutionLevel(Index: Int) -> Int{
        
        let thisMon = Pokedex[Index];
        return thisMon.Level;
        
    }
    
    public func HasEvolution(Index: Int) -> Bool{
        
        let thisMon = Pokedex[Index];
        if thisMon.Evolution != nil{
            return true;
        }
        else{
            return false;
        }
        
      }
    
    public func HasOnePreEvolution(Index: Int) -> Bool{
        
        let thisMon = Pokedex[Index];
        if thisMon.HasOnePreEvo == true{
            return true;
        }
        else{
            return false;
        }
        
      }
    
    public func HasTwoPreEvolutions(Index: Int) -> Bool{
        
        let thisMon = Pokedex[Index];
        if thisMon.HasTwoPreEvos == true{
            return true;
        }
        else{
            return false;
        }
        
      }
    
    public func ClearDex(){
        
        Pokedex.removeAll();
        
    }
    
    
    
    public func CreatePokedex(){
        
        KantoDex();
        

    }

    private func KantoDex(){
        
        //-------------------Kanto Pokedex. # 001 - #151 -------------------//
        
        let Bulbasaur = Pokemon();
        Bulbasaur.NewPokemon(newIndex: "001", newName: "Bulbasaur", newImage: #imageLiteral(resourceName: "bulbasaur"), newHp: 45, newAttack: 49, newDefense: 49, newSpeed: 45, newSp_Def: 65, newSp_Att: 65);
        
        let Ivysaur = Pokemon();
        Ivysaur.NewPokemon(newIndex: "002", newName: "Ivysaur", newImage: #imageLiteral(resourceName: "ivysaur"), newHp: 60, newAttack: 62, newDefense: 63, newSpeed: 60, newSp_Def: 80, newSp_Att: 80);
        
        let Venasaur = Pokemon();
        Venasaur.NewPokemon(newIndex: "003", newName: "Venasaur", newImage: #imageLiteral(resourceName: "venusaur"), newHp: 80, newAttack: 82, newDefense: 83, newSpeed: 80, newSp_Def: 100, newSp_Att: 100);
        
        Bulbasaur.setHasOnePreEvolution(hasEvo: false);
        Bulbasaur.NewEvolution(nextEvolution: Ivysaur, nextLevel: 16 );
        
        Ivysaur.setHasOnePreEvolution(hasEvo: true);
        Ivysaur.NewEvolution(nextEvolution: Venasaur, nextLevel: 32);
        Ivysaur.PreEvolutionOne = Bulbasaur;
        
        Venasaur.setHasTwoPreEvolutions(hasEvos: true);
        Venasaur.PreEvolutionOne = Bulbasaur;
        Venasaur.PreEvolutionTwo = Ivysaur;
        Pokedex.append(Bulbasaur);
        Pokedex.append(Ivysaur);
        Pokedex.append(Venasaur);
        
        
        let Charmander = Pokemon();
        Charmander.NewPokemon(newIndex: "004", newName: "Charmander", newImage: #imageLiteral(resourceName: "charmander"), newHp: 39, newAttack: 52, newDefense: 43, newSpeed: 65, newSp_Def: 50, newSp_Att: 60);
        
        let Charmeleon = Pokemon();
        Charmeleon.NewPokemon(newIndex: "005", newName: "Charmeleon", newImage: #imageLiteral(resourceName: "charmeleon"), newHp: 58, newAttack: 64, newDefense: 58, newSpeed: 80, newSp_Def: 65, newSp_Att: 80);
        
        let Charizard = Pokemon();
        Charizard.NewPokemon(newIndex: "006", newName: "Charizard", newImage: #imageLiteral(resourceName: "charizard"), newHp: 78, newAttack: 84, newDefense: 78, newSpeed: 100, newSp_Def: 85, newSp_Att: 109);
        
        Charmander.NewEvolution(nextEvolution: Charmeleon, nextLevel: 16);
        
        Charmeleon.setHasOnePreEvolution(hasEvo: true);
        Charmeleon.NewEvolution(nextEvolution: Charizard, nextLevel: 36);
        Charmeleon.PreEvolutionOne = Charmander;
        
        Charizard.setHasTwoPreEvolutions(hasEvos: true);
        Charizard.PreEvolutionOne = Charmander;
        Charizard.PreEvolutionTwo = Charmeleon;
        Pokedex.append(Charmander);
        Pokedex.append(Charmeleon);
        Pokedex.append(Charizard);
        
        let Squirtle = Pokemon();
        Squirtle.NewPokemon(newIndex: "007", newName: "Squirtle", newImage: #imageLiteral(resourceName: "squirtle"), newHp: 44, newAttack: 48, newDefense: 65, newSpeed: 43, newSp_Def: 64, newSp_Att: 50);
        
        let Wartortle = Pokemon();
        Wartortle.NewPokemon(newIndex: "008", newName: "Wartortle", newImage: #imageLiteral(resourceName: "wartortle"), newHp: 59, newAttack: 63, newDefense: 80, newSpeed: 58, newSp_Def: 80, newSp_Att: 65);
        
        let Blastoise = Pokemon();
        Blastoise.NewPokemon(newIndex: "009", newName: "Blastoise", newImage: #imageLiteral(resourceName: "blastoise"), newHp: 79, newAttack: 83, newDefense: 100, newSpeed: 78, newSp_Def: 105, newSp_Att: 85);
        
        Squirtle.NewEvolution(nextEvolution: Wartortle, nextLevel: 16);
        
        Wartortle.setHasOnePreEvolution(hasEvo: true);
        Wartortle.NewEvolution(nextEvolution: Blastoise, nextLevel: 36);
        Wartortle.PreEvolutionOne = Squirtle;
        

        Blastoise.setHasTwoPreEvolutions(hasEvos: true)
        Blastoise.PreEvolutionOne = Squirtle;
        Blastoise.PreEvolutionTwo = Wartortle;
        Pokedex.append(Squirtle);
        Pokedex.append(Wartortle);
        Pokedex.append(Blastoise);
        
        //------------------- End of Kanto Pokedex. # 001 - #151 -------------------//
        
    }
    
    
    
}
