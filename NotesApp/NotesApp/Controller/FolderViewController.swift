//
//  FolderViewController.swift
//  NotesApp
//
//  Created by Apple Macbook Pro 13 on 24.02.23.
//

import UIKit

final class FolderViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    @IBAction private func createFolderAction(_ sender: UIBarButtonItem) {
        let control = CreateFolderViewController(nibName: "CreateFolderViewController", bundle: nil)
        navigationController?.present(control, animated: true)
    }
    
    @IBAction private func createNoteAciton(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: - Private API

private extension FolderViewController {
    func setupUI() {
        title = "Folders"
    }
}
