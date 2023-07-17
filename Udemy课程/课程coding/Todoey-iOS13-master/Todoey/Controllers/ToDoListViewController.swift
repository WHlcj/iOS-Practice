
import UIKit
import RealmSwift

//@available(iOS 16.0, *)
class ToDoListViewController: UITableViewController {
    
    var items: Results<Item>?
    let realm = try! Realm()
    // NSCoder
    //let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appending(path: "Items.plist")
    //    // CoreData
    //    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    // MARK: - Tableview Datasource Methods
    // 设置行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 1
    }
    // 设置行内信息
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // 设置表格每一行的文本内容
        if let item = items?[indexPath.row] {
            cell.textLabel?.text = item.title
            // 设置待办事项的状态图标
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Item Added"
        }
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    // 点击选中item
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = items?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                    // 删除
                    //realm.delete(item)
                }
            } catch {
                print("Error saving done status, \(error)")
            }
        }
        tableView.reloadData()
        // 添加标记
        // itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        // itemArray[indexPath.row].setValue("Completed", forKey: "title")
        
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        
        //        // 保存数据
        //        self.saveItems()
        // 取消选择的行。点击后，变成灰色又迅速变回白色
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: Any) {
        // 输入的信息
        var textField = UITextField()
        // 警报信息
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        //
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //            let newItem = Item(context: self.context)
            //            newItem.title = textField.text ?? "New Item"
            //            newItem.done = false
            //            newItem.parentCategory = self.selectedCategory
            //            self.itemArray.append(newItem)
            //            // 保存数据
            //            self.saveItems()
            
            if let currentCategory = self.selectedCategory {
                let newItem = Item()
                newItem.title = textField.text ?? "New Item"
                newItem.dateCreated = Date()
                do {
                    try self.realm.write {
                        // 注意，因为items不能被常规直接改变，这部分代码必须在write内。
                        currentCategory.items.append(newItem)
                        self.realm.add(newItem)
                    }
                } catch {
                    print("Error in saveItem: \(error)")
                }
                self.tableView.reloadData()
            }
            
        }
        // 增加取消action
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    //    func saveItems() {
    //        // NSCoder
    //        let encoder = PropertyListEncoder()
    //
    //        do {
    //            let data = try encoder.encode(self.itemArray)
    //            try data.write(to: self.dataFilePath!)
    //        } catch {
    //            print("Error encoding item array \(error)")
    //        }
    // CoreData
    //        do {
    //            try context.save()
    //        } catch {
    //            print("Error saving context \(error)")
    //        }
    //        // 刷新视图
    //        self.tableView.reloadData()
    //    }
    
    //    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
    //        // NSCoder
    ////        if let data = try? Data(contentsOf: dataFilePath!) {
    ////            let decoder = PropertyListDecoder()
    ////            do {
    ////                itemArray = try decoder.decode([Item].self, from: data)
    ////            } catch {
    ////                print("Error decoding item array, \(error)")
    ////            }
    ////        }
    //        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
    //
    //        if let addtionalPredicate = predicate {
    //            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
    //        } else {
    //            request.predicate = categoryPredicate
    //        }
    //
    //        do {
    //            itemArray = try context.fetch(request)
    //        } catch {
    //            print("Error fetching data from context \(error)")
    //        }
    //        tableView.reloadData()
    //    }
    // Realm
    func loadItems() {
        items = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
    }
}

// MARK: - SearchBarDelegate
extension ToDoListViewController: UISearchBarDelegate {
    // 输入文本后点击
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        // 创建搜索请求
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        // 创建搜索条件谓语,[cd]表示不区分大小写和音标
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//        // 结果按title字母顺序生序
//        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
//        // 可以确立多个排序规则，这里只指定了一个规则
//        request.sortDescriptors = [sortDescriptor]
//        // 搜索数据显示
//        loadItems(with: request, predicate: predicate)
        //items = items?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
        items = items?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 当清空搜索栏时显示原数据
        if searchBar.text?.count == 0 {
            loadItems()
            // 消除键盘和搜索栏光标
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }

}

