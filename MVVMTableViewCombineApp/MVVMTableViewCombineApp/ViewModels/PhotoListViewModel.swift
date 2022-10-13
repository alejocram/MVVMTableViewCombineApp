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
        APIService.share.downloadPhotos { [weak self] photos in
            for photo in photos {
                self?.photoNames.append(photo.name)
            }
        }
    }
}
