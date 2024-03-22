//
//  ViewController.swift
//  pokemonapp
//
//  Created by Orhun Akmil on 21.03.2024.
//

import UIKit

class PokemonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedCell : PokemonViewModel?
    private var pokemons: [PokemonViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()        
        configTableView()
        fetchData()
    }

    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: PokeKey.PokemonTableViewCell, bundle: nil), forCellReuseIdentifier: PokeKey.PokemonCell)
    }
    
    
    func fetchData() {
        
        if let url = URL(string: PokeKey.pokemonListapiUrl) {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data, error == nil else { return }
                do {
                    let decoder = JSONDecoder()
                    let pokemons = try decoder.decode([PokemonViewModel].self, from: data)
                    DispatchQueue.main.async {
                        self?.pokemons = pokemons
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = pokemons[indexPath.row]
        performSegue(withIdentifier: PokeKey.toDetail, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PokeKey.toDetail {
            let vc = segue.destination as? PokemonDetailViewController
            vc?.selectedCellForDetail = selectedCell
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokeKey.PokemonCell, for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }

        let pokemon = pokemons[indexPath.row]
        cell.titleLabel.text = pokemon.name
        cell.descriptionLabel.text = pokemon.description
        if let imageURL = URL(string: pokemon.imageUrl ?? "") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        cell.pokemonImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
