//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Changjun Li on 2023/7/16.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    // Results是一个自动更新容器
    var categories: Results<Category>?
    // CoreData
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NSCoder - FileManager
        loadCategories()
    }

    // 添加按钮
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // 输入的信息
        var textField = UITextField()
        // 警报信息
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textField.text ?? "New Category"
            // 保存数据
            self.saveCategories(category: newCategory)
        }
        
        // 为警报添加文本输入框
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        // 添加警报
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

// MARK: - TableViewDelegate

extension CategoryViewController {
    // tableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    // tableView的内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category Added Yet"
        
        return cell
    }
    // 跳转
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if #available(iOS 16.0, *) {
            let destinationVC = segue.destination as! ToDoListViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categories?[indexPath.row]
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    
}

// MARK: - CoreData Manipulation Methods

extension CategoryViewController {
    func saveCategories(category: Category) {
//        // NSCoder
//        let encoder = PropertyListEncoder()
//
//        do {
//            let data = try encoder.encode(self.itemArray)
//            try data.write(to: self.dataFilePath!)
//        } catch {
//            print("Error encoding item array \(error)")
//        }
        
        do {
            //try context.save()
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        // 刷新视图
        self.tableView.reloadData()
    }
    
    func loadCategories() {
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
//    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
//         NSCoder
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
//            } catch {
//                print("Error decoding item array, \(error)")
//            }
//        }
//         Core Data
//        do {
//            categoryArray = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//        tableView.reloadData()
//    }
}
