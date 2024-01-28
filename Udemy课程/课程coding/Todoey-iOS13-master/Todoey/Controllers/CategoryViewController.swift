//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Changjun Li on 2023/7/16.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    // Results是一个自动更新容器
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
        tableView.rowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}
        navBar.backgroundColor = UIColor(hexString: "1D9BF6")
    }

    // 添加按钮
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // 输入的信息
        var textField = UITextField()
        // 警报信息
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        // 取消
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textField.text ?? "New Category"
            newCategory.color = UIColor.randomFlat().hexValue()
            // 保存数据
            self.saveCategories(category: newCategory)
        }
        
        // 为警报添加文本输入框
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        // 添加取消
        alert.addAction(cancel)
        // 添加警报
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func updateModel(at indexPath: IndexPath) {
        // handle action by updating model with deletion
        if let oldcategory = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(oldcategory)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
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
        // 继承父类
        let cell = super.tableView(tableView, cellForRowAt: indexPath)

        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category Added Yet"
        
        
        
        if let color = UIColor(hexString: (categories?[indexPath.row].color)!) {
            cell.backgroundColor = color
            cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
        } else {
            cell.backgroundColor = UIColor.cyan
        }
        
        return cell
    }
    // 页面跳转
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
}

