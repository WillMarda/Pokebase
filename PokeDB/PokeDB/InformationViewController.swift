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
    
    var MyImage = #imageLiteral(resourceName: "Kanto");
    var MyName = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        PokemonNameLabel.text = MyName;
        PokemonImageViewer.image = MyImage;
        
        print(MyName)
    }
    


    
    
    
}
