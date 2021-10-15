//
//  Info.swift
//  Pokedex
//
//  Created by Tuba Nur on 15.10.2021.
//

import Foundation
import UIKit

class Info: UIView {
    
    //var delegate: InfoDelegate?
    
    var pokemon: Pokemon?{
        didSet{
            guard let pokemon = self.pokemon else {return}
            guard let type = pokemon.type else {return}
            guard let defense = pokemon.defense else {return}
            guard let id = pokemon.id else {return}
            
        
        }
    }
    
    
    let imageView: UIImageView = {
       let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.backgroundColor = .white
      return temp
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewConfigurations(){
        
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
       
        addSubview(imageView)
        
        imageView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48)
    }
}
