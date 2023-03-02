//
//  CoreDataManager.swift
//  NotesApp
//
//  Created by Apple Macbook Pro 13 on 24.02.23.
//
import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init() {}
}

extension CoreDataManager {
    // Loading
    func loadFolders(
        with request: NSFetchRequest<Folder> = Folder.fetchRequest(),
        predicate: String? = nil
    ) -> [Folder]? {
        if let predicate = predicate {
            request.predicate = NSPredicate(format: "name CONTAINS", predicate)
        }
        do {
            return try context.fetch(request)
        } catch  {
            print("Error loading folders: \(error)")
            return nil
        }
    }
    
    // Deleting
    func deleteFromContext(object: NSManagedObject) {
        CoreDataManager.shared.context.delete(object)
    }
    
    // Saving
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error while saving context: \(error)")
        }
    }
}
