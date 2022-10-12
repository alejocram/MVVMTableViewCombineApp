//
//  PhotoListViewModel.swift
//  MVVMTableViewCombineApp
//
//  Created by Alejocram on 12/10/22.
//

import Foundation

final class PhotoListViewModel {
    @Published var photoNames: [String] = []
    
    func getPhotos() {
        let photos = APIService.share.downloadPhotos()
        for photo in photos {
            photoNames.append(photo.name)
        }
    }
}
