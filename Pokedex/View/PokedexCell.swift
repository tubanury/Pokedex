//
//  PokedexCell.swift
//  Pokedex
//
//  Created by Tuba Nur on 10.10.2021.
//

import Foundation
import UIKit

class PokedexCell: UICollectionViewCell{
    
    var pokemon: Pokemon?{
        didSet{
            nameLabel.text = pokemon?.name?.capitalized

            imageView.image = pokemon?.image
            mainContainerView.backgroundColor = getColor(type: (pokemon?.type)!)
            imageView.backgroundColor = getColor(type: (pokemon?.type)!)
        }
        
    }
    
    private lazy var shadowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius = 6
        return view
    }()
    var imageView: UIImageView = {
       let iv = UIImageView()
        //iv.backgroundColor = .groupTableViewBackground
        //iv.backgroundColor = #colorLiteral(red: 0.2050352991, green: 0.770994544, blue: 0.3534177542, alpha: 1)
        iv.contentMode = .scaleAspectFit
        //iv.contentMode = .topRight
        
        return iv
    }()
    
    lazy var mainContainerView: UIView = {
        let temp = UIView()
        temp.backgroundColor = #colorLiteral(red: 0.2050352991, green: 0.770994544, blue: 0.3534177542, alpha: 1)
        temp.addSubview(containerView)
        
        //containerView.center(inView: temp)
        containerView.anchor(top: temp.topAnchor, left: temp.leftAnchor, bottom: temp.bottomAnchor, right: temp.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        return temp
    }()
    
   
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white.withAlphaComponent(0.4)
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 10
        //nameLabel.center(inView: view)
        nameLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
       
        return view
    }()
   
    let nameLabel: UILabel = {
       let temp = UILabel()
        temp.textColor = .white
        //temp.font = UIFont.systemFont(ofSize: 16)
        temp.font = UIFont.pixel14
        temp.text = "Bulbasaur"
        /*temp.layer.masksToBounds = true
        temp.layer.cornerRadius = 10
        temp.backgroundColor = .white.withAlphaComponent(0.4)*/
        temp.textAlignment = .center
        
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
       
        addSubview(shadowContainerView)
        
        shadowContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48)
        
        shadowContainerView.addSubview(mainContainerView)
        mainContainerView.anchor(top: shadowContainerView.topAnchor, left: shadowContainerView.leftAnchor, bottom: shadowContainerView.bottomAnchor, right: shadowContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48)
       
        addSubview(imageView)

        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 32)
        
    }
    
    func getColor(type: String) -> UIColor{
        switch type{
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "physic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "bug": return .systemTeal
        case "fairy": return .systemPink
        case "grass": return .systemGreen
        default: return .systemIndigo
        }
    }
    
}
