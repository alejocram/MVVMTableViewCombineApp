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
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.photoNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.photoNames.count
    }
}
