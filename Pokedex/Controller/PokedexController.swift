//
//  PokedexController.swift
//  Pokedex
//
//  Created by Tuba Nur on 10.10.2021.
//

import UIKit


private let reuseIdentifier = "PokedexCell"
class PokedexController: UICollectionViewController{
    
    
    var pokemons = [Pokemon]()
    
    //MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        fetchPokemon()
    }
    //MARK: API
    
    func fetchPokemon(){
        Service.shared.fetchPokemonData { (pokemons) in
            DispatchQueue.main.async {
                self.pokemons = pokemons
                self.collectionView.reloadData()
            }
        }
    }
        
    // MARK: Helper Function
    func configureViewComponents(){
        collectionView.backgroundColor = .white
        //navigationController?.navigationBar.barTintColor = .mainPink()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9411764706, green: 0.4705882353, blue: 0.3921568627, alpha: 1)
        navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        //navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Pokedex"
        
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:)))
       longPressGR.minimumPressDuration = 0.5
       longPressGR.delaysTouchesBegan = true
       self.collectionView.addGestureRecognizer(longPressGR)
       
    }
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
       
       
        //change to back image
        let p = gesture.location(in: self.collectionView)
        guard let indexPath = self.collectionView.indexPathForItem(at: p) else {return}
        guard let cell = self.collectionView.cellForItem(at: indexPath) as? PokedexCell else {return}
        let pokemonus = pokemons[indexPath.row]

        if gesture.state == .began {
            cell.imageView.image = pokemonus.backImage
        }
        if gesture.state != .ended {
            return
        }
        //reset image
        if gesture.state == .ended {
           cell.imageView.image = pokemonus.image
        }
                
    
}

}

extension PokedexController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        cell.pokemon = pokemons[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("selected")
        if let cell = collectionView.cellForItem(at: indexPath) as? PokedexCell{
            //let pokemonus = pokemons[indexPath.row]
            //cell.imageView.image = pokemonus.backImage
        }
    }
}

extension PokedexController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36)/2
        return CGSize(width: width, height: width/1.5)
    }
}
