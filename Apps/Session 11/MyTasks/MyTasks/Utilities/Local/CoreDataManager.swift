//
//  CoreDataManager.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 07/11/2023.
//

import UIKit
import CoreData

class CoreDataManager {
    
    func save(model: MyTask) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "MyTaskEntity",
                                                in: managedContext)!
        
        let myTask = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        myTask.setValue(model.id, forKeyPath: "id")
        myTask.setValue(model.title, forKeyPath: "title")
        myTask.setValue(model.descriptionTitle, forKeyPath: "descriptionTitle")
        myTask.setValue(model.date, forKeyPath: "date")
        myTask.setValue(model.time, forKeyPath: "time")
        myTask.setValue(model.tag.title, forKeyPath: "tagTitle")
        myTask.setValue(model.tag.color, forKeyPath: "tagColor")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetch() -> [NSManagedObject]? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MyTaskEntity")
        
        do {
            return try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    /*
    func fetchMyTasks() -> [MyTask]? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MyTaskEntity")
        
        do {
            let data = try managedContext.fetch(fetchRequest)
            var myTasks = [MyTask]()
            data.forEach { item in
                
                let id = item.value(forKey: "id") as! String
                let title = item.value(forKey: "title") as! String
                let descriptionTitle = item.value(forKey: "descriptionTitle") as! String
                let date = item.value(forKey: "date") as! String
                let time = item.value(forKey: "time") as! String
                
                let tag = MyTaskTag(
                    title: item.value(forKey: "tagTitle") as! String,
                    color: item.value(forKey: "tagColor") as! String
                )
                
                let myTask = MyTask(id: id,
                                    title: title,
                                    descriptionTitle: descriptionTitle,
                                    date: date,
                                    time: time,
                                    tag: tag)
                
                myTasks.append(myTask)
            }
            
            return myTasks
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    */
}
