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
    
    private init() {
        createDefaultFolder()
    }
}

extension CoreDataManager {
    // Loading
    func loadFolders(
        with request: NSFetchRequest<Folder> = Folder.fetchRequest(),
        predicate: String? = nil
    ) -> [Folder]? {
        
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        if let predicate = predicate {
            request.predicate = NSPredicate(format: "name CONTAINS %@", predicate)
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

private extension CoreDataManager {
    func createDefaultFolder() {
        if let folders = loadFolders(predicate: "All Notes"),
           folders.count == 0 {
            let allNotes = Folder(context: context)
            allNotes.name = "All Notes"
            allNotes.id = 0
            saveContext()
            
        }
    }
}
