//
//  ViewController.swift
//  PiscumPhotos
//
//  Created by Salma Ayuningtyas on 10/17/25.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    
    // Setup Table View
    func setUpTableView() {
        tableView.register(PiscumPhotoCell.self, forCellReuseIdentifier: PiscumPhotoCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }


}; extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PiscumPhotoCell.identifier, for: indexPath) as? PiscumPhotoCell else {
            return UITableViewCell()
        }
        
        cell.setupUI()
        return cell
    }
    
}

