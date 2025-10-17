//
//  APIService.swift
//  PiscumPhotos
//
//  Created by Salma Ayuningtyas on 10/17/25.
//

import Foundation
import Alamofire

class APIService {
    static let piscumPhotosAPI = "https://picsum.photos/v2/list?page=1&limit=10"
    
    
    static let shared = APIService()
    
    func fetchPhotosList(completion: @escaping (Result<[PiscumPhotosModel]?, Error>) -> Void) {
        
        let endpoint = APIService.piscumPhotosAPI
        
        AF.request(endpoint).responseDecodable(of: [PiscumPhotosModel].self) {response in
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                print("error")
            }
            
        }
            
    }
}
