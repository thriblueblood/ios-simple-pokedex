//
//  ViewController.swift
//  Pokedex
//
//  Created by T Thirayut on 15/3/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pokemons = [Pokemon]()
    var nextList = 0
    var pokemonHandler = PokemonHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTableView()
        
        pokemonHandler.fetchAllPokemon(nextList: nextList) { result in
            self.pokemons = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonTableViewCell")
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
        cell.setPokemon(viewModel: pokemons[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == pokemons.count-10{
            nextList += 20
            
            pokemonHandler.fetchAllPokemon(nextList: nextList) { result in
                self.pokemons.append(contentsOf: result)
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
    }
}

