//
//  CreateFolderViewController.swift
//  NotesApp
//
//  Created by Apple Macbook Pro 13 on 24.02.23.
//

import UIKit

final class CreateFolderViewController: UIViewController {

    var delegate: FolderViewControllerDelegate?
    
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
            folderTitleLabel.becomeFirstResponder()
        }
    }
    
    @IBAction private func doneAction(_ sender: UIButton) {
        createFolder()
        self.dismiss(animated: true)
    }
    
    @IBAction private func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        folderTitleLabel.selectAll(folderTitleLabel.text)
    }
}

// MARK: - Private API

private extension CreateFolderViewController {
    func createFolder() {
        guard let delegate = delegate else {
            return
        }
        
        guard
            let folderTitle = folderTitleLabel.text,
            !folderTitle.isEmpty
        else {
            return
        }
        
        let folder = Folder(context: CoreDataManager.shared.context)
        folder.name = folderTitle
        
        
        guard let folders = CoreDataManager.shared.loadFolders() else {
            return
        }
        
        folder.id = Int16(folders.count)
        
        delegate.addFolder(folder: folder)
    }
}
