//
//  PokedexCell.swift
//  Pokedex
//
//  Created by Tuba Nur on 10.10.2021.
//

import Foundation
import UIKit

class PokedexCell: UICollectionViewCell{
    
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .groupTableViewBackground
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var mainContainerView: UIView = {
        let temp = UIView()
        temp.backgroundColor = .mainPink()
        temp.addSubview(nameLabel)
        nameLabel.center(inView: temp)
        return temp
    }()
    
    let nameLabel: UILabel = {
       let temp = UILabel()
        temp.textColor = .white
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.text = "Bulbasaur"
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

        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 32)
        
        addSubview(mainContainerView)
        
        mainContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 32)
    }
    
}
