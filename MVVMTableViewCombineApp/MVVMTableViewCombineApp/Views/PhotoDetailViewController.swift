//
//  PhotoDetailViewController.swift
//  MVVMTableViewCombineApp
//
//  Created by Alejocram on 15/10/22.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet var descriptionLabel: UILabel!
    
    var photoName: String?
    var photoDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = photoName
        descriptionLabel.text = photoDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
