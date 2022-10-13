//
//  APIService.swift
//  MVVMTableViewCombineApp
//
//  Created by Alejocram on 12/10/22.
//

import Foundation

final class APIService {
    static let share = APIService()
    
    init() {}
    
    func downloadPhotos(completion: @escaping (_ photos: [Photo]) -> ()) {
        DispatchQueue.global().async {
            sleep(3)
            let photo1 = Photo(name: "Photo 1", url: "", description: nil, date: Date(), ranking: 4.4)
            let photo2 = Photo(name: "Photo 2", url: "", description: nil, date: Date(), ranking: 4.4)
            let photo3 = Photo(name: "Photo 3", url: "", description: nil, date: Date(), ranking: 4.4)
            let photos = [photo1, photo2, photo3]
            completion(photos)
        }
    }
}
