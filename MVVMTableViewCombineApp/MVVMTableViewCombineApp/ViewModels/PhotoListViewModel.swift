//
//  PhotoListViewModel.swift
//  MVVMTableViewCombineApp
//
//  Created by Alejocram on 12/10/22.
//

import Foundation
import Combine

final class PhotoListViewModel {
    @Published var photoNames: [String] = []
    @Published var photoDescriptions: [String?] = []
    
    private var cancellables: [AnyCancellable] = []
    
    func getPhotos() {
        APIService.share.downloadPhotos()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Publisher stopped observing")
                case .failure(let error):
                    print("This is any error", error)
                }
            } receiveValue: { [weak self] photos in
                for photo in photos {
                    self?.photoNames.append(photo.name)
                    self?.photoDescriptions.append(photo.description)
                }
            }.store(in: &cancellables)
    }
}

