//
//  PhotoListViewController.swift
//  MVVMTableViewCombineApp
//
//  Created by Alejocram on 12/10/22.
//

import UIKit
import Combine

class PhotoListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private let viewModel = PhotoListViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        initVM()
    }

    func initVM() {
        viewModel.$photoNames.sink { [weak self] photoNames in
            DispatchQueue.main.async {
                if photoNames.count > 0 {
                    self?.tableView.reloadData()
                }
            }
        }.store(in: &cancellables)
        
        viewModel.getPhotos()
    }
}

extension PhotoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoListTableViewCell else {
            fatalError("TableViewCell doesn't exits in storyboard")
        }
        cell.title.text = viewModel.photoNames[indexPath.row]
        cell.subtitle?.text = viewModel.photoDescriptions[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photoNames.count
    }
}

extension PhotoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let photoDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoDetailViewController") as? PhotoDetailViewController else {
            fatalError("View Controller doesn't find in storyboard")
        }
        photoDetailViewController.photoName = viewModel.photoNames[indexPath.row]
        photoDetailViewController.photoDescription = viewModel.photoDescriptions[indexPath.row]
        self.navigationController?.pushViewController(photoDetailViewController, animated: true)
    }
}

class PhotoListTableViewCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
}
