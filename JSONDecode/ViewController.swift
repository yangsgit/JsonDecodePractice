//
//  ViewController.swift
//  JSONDecode
//
//  Created by Yang Li on 12/2/20.
//

import UIKit

class ViewController: UIViewController {
    
    // dependencies
    let network = NetWork()
    let decoder = JSONDecoder()
    
    @IBOutlet weak var squad: UITextField!
    @IBOutlet weak var hometown: UITextField!
    @IBOutlet weak var formDate: UITextField!
    @IBOutlet weak var base: UITextField!
    
    @IBOutlet weak var tableview: UITableView!
    
    private var superHeroClub: SuperHeroClub?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        if let url = URL(string: "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json") {
            fetch(url: url)
        }
    }
    
    private func fetch(url: URL) {
        network.webResource(url: url) {[weak self] data in
            self?.superHeroClub = try? self?.decoder.decode(SuperHeroClub.self, from: data)
            DispatchQueue.main.async {
                self?.updateUI()
                self?.tableview.reloadData()
            }
        }
    }
    
    private func updateUI() {
        squad.text = self.superHeroClub?.squadName
        hometown.text = self.superHeroClub?.homeTown
        formDate.text = self.superHeroClub?.formed.description
        base.text = self.superHeroClub?.base
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let members = self.superHeroClub?.members else { return 0 }
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") else { return UITableViewCell() }
        guard let club = superHeroClub else {
            return UITableViewCell()
        }
        cell.textLabel?.text = club.members[indexPath.row].name
        cell.detailTextLabel?.text = club.members[indexPath.row].secretIdentity
        return cell
    }
}

