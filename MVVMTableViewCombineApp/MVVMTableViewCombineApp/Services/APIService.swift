//
//  APIService.swift
//  MVVMTableViewCombineApp
//
//  Created by Alejocram on 12/10/22.
//

import Foundation
import Combine

final class APIService {
    static let share = APIService()
    
    init() {}
    
    func downloadPhotos() -> Future<[Photo], Error>  {
        return Future { promise in
            let photo1 = Photo(name: "Photo 1", url: "", description: "Balloon", date: Date(), ranking: 4.4)
            let photo2 = Photo(name: "Photo 2", url: "", description: "", date: Date(), ranking: 4.4)
            let photo3 = Photo(name: "Photo 3", url: "", description: "Dog", date: Date(), ranking: 4.4)
            let photos = [photo1, photo2, photo3]
            promise(.success(photos))
        }
    }
}
