
import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    
    var items = [Item]()
    // CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: Any) {
        // 输入的信息
        var textField = UITextField()
        // 警报信息
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        // 添加Item
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item(context: self.context)
            newItem.title = textField.text ?? "New Item"
            newItem.done = false
            newItem.parentCategory = self.selectedCategory
            self.items.append(newItem)
            // 保存数据
            self.saveItems()
        }
        // 取消action
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - TableView Delegate
extension ToDoListViewController {
    // 设置行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    // 设置行内信息
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // 设置表格每一行的文本内容
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        // 设置待办事项的状态图标
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    // 点击选中item
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 添加标记
        items[indexPath.row].done = !items[indexPath.row].done
        //items[indexPath.row].setValue("Completed", forKey: "title")
        // 删除
        //context.delete(items[indexPath.row])
        //items.remove(at: indexPath.row)
        
        // 保存数据
        self.saveItems()
        // 取消选择的行。点击后，变成灰色又迅速变回白色
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CoreData Manipulate

extension ToDoListViewController {
    func saveItems() {
        //CoreData
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        // 刷新视图
        self.tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        if let addtionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }
        
        do {
            items = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
}

// MARK: - SearchBarDelegate
extension ToDoListViewController: UISearchBarDelegate {
    // 输入文本后点击
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 创建搜索请求
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        // 创建搜索条件谓语,[cd]表示不区分大小写和音标
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        // 结果按title字母顺序生序
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        // 可以确立多个排序规则，这里只指定了一个规则
        request.sortDescriptors = [sortDescriptor]
        // 搜索数据显示
        loadItems(with: request, predicate: predicate)
        
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

