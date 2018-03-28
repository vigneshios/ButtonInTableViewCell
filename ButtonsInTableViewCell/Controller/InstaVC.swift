//
//  InstaVC.swift
//  ButtonsInTableViewCell
//
//  Created by Apple on 28/03/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import UIKit

class InstaVC: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        DataService.instance.getQuotes { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }

    func setupTableView(){
       tableView.dataSource = self
       tableView.delegate = self
       tableView.estimatedRowHeight = UITableViewAutomaticDimension
       tableView.rowHeight = 100.0
    }

}
extension InstaVC : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.instas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InstaCell", for: indexPath) as? InstaCell else {return UITableViewCell()}
        let quote = DataService.instance.instas[indexPath.row]
        cell.configureCell(quote: quote)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension InstaVC: MyCellDelegate {
    func didLikeButtonTapped(_ sender: InstaCell) {
        guard let tappedIndex = tableView.indexPath(for: sender) else {return}
        print("LIKE", sender, tappedIndex)
        sender.likeButton.setTitleColor(.red, for: .normal)
        
    }
    
    func didLoveButtonTapped(_ sender: InstaCell) {
        guard let tappedIndex = tableView.indexPath(for: sender) else {return}
        print("LOVE", sender, tappedIndex)
        sender.loveButton.setTitleColor(.orange, for: .normal)
    }
    
    func didDeleteButtontapped(_ sender: InstaCell) {
        guard let tappedIndex = tableView.indexPath(for: sender) else {return}
        print("DELETE", sender, tappedIndex)
        
        // Delete row
        DataService.instance.instas.remove(at: tappedIndex.row)
        tableView.deleteRows(at: [tappedIndex], with: .automatic)
        sender.deleteButton.setTitleColor(.red, for: .normal)
    }
    
    
}




