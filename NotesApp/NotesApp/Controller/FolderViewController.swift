//
//  FolderViewController.swift
//  NotesApp
//
//  Created by Apple Macbook Pro 13 on 24.02.23.
//

import UIKit

protocol FolderViewControllerDelegate {
    func addFolder(folder: Folder)
}

final class FolderViewController: UIViewController {
    
    var folders = [Folder]()
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet private weak var searchBar: UISearchBar!
    
    @IBAction private func createFolderAction(_ sender: UIBarButtonItem) {
        let control = CreateFolderViewController(nibName: "CreateFolderViewController", bundle: nil)
        control.delegate = self
        navigationController?.present(control, animated: true)
    }
    
    @IBAction private func createNoteAciton(_ sender: UIBarButtonItem) {
        for folder in folders {
            CoreDataManager.shared.context.delete(folder)
        }
        
        folders.removeAll()
        CoreDataManager.shared.saveContext()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadFolders()
    }
}

// MARK: - UITableViewDataSource

extension FolderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FolderTableViewCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = folders[indexPath.row].name
        cell.detailTextLabel?.text = "number"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folders.count
    }
}

// MARK: - UITableViewDelegate

extension FolderViewController: UITableViewDelegate {
    
}

// MARK: - FolderViewControllerDelegate

extension FolderViewController: FolderViewControllerDelegate {
    func addFolder(folder: Folder) {
        folders.append(folder)
        CoreDataManager.shared.saveContext()
        tableView.insertRows(at: [IndexPath(row: folders.count - 1, section: 0)], with: .fade)
    }
}

// MARK: - Private API

private extension FolderViewController {
    func setupUI() {
        title = "Folders"
    }
    
    func loadFolders() {
        guard let folders = CoreDataManager.shared.loadFolders() else {
            return
        }
        
        self.folders = folders
    }
}
