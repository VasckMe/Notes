//
//  CreateFolderViewController.swift
//  NotesApp
//
//  Created by Apple Macbook Pro 13 on 24.02.23.
//

import UIKit

final class CreateFolderViewController: UIViewController {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
    }
    @IBOutlet private weak var doneButtonOutlet: UIButton! {
        didSet {
            doneButtonOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        }
    }
    
    @IBOutlet private weak var cancelButtonOutlet: UIButton! {
        didSet {
            cancelButtonOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    
    @IBOutlet private weak var folderTitleLabel: UITextField! {
        didSet {
            folderTitleLabel.text = "New Folder"
        }
    }
    
    @IBAction private func doneAction(_ sender: UIButton) {
        #warning("TODO")
    }
    
    @IBAction private func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
