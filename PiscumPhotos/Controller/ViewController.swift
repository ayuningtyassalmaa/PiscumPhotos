//
//  ViewController.swift
//  PiscumPhotos
//
//  Created by Salma Ayuningtyas on 10/17/25.
//

import UIKit

class ViewController: UIViewController {
    
    var errorMessage: String? = nil
    
    private var listPhotos: [PiscumPhotosModel] = []
    private let apiService = APIService()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        getDataPhotos()
    }
    
    
    // Setup Table View
    func setUpTableView() {
        tableView.register(PiscumPhotoCell.self, forCellReuseIdentifier: PiscumPhotoCell.identifier)
        tableView.register(ErrorUICell.self, forCellReuseIdentifier: ErrorUICell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // fetch API
    func getDataPhotos() {
        APIService.shared.fetchPhotosList { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let model):
               
                self.listPhotos = model ?? []
                    
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                self.listPhotos = []
                print("gagal memuat")
                self.tableView.reloadData()
            }
            
        }
    }


}; extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return errorMessage == nil ? listPhotos.count : 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = listPhotos[indexPath.item]
        let urlImg = data.download_url
        let authorName = data.author
        
        if let errorMessage = errorMessage {
            let cell = tableView.dequeueReusableCell(withIdentifier: ErrorUICell.identifier, for: indexPath) as! ErrorUICell
            return cell
        } else {
           let cell = tableView.dequeueReusableCell(withIdentifier: PiscumPhotoCell.identifier, for: indexPath) as? PiscumPhotoCell
    
            cell?.setupUI()
            cell?.configure(with: authorName, with: urlImg)
            return cell ?? UITableViewCell()
        }
    }
}

