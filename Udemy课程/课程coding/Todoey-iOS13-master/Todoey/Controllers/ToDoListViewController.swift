
import UIKit
import RealmSwift
import ChameleonFramework

class ToDoListViewController: SwipeTableViewController {
    
    var items: Results<Item>?
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 取消分割线
        tableView.separatorStyle = .none
        
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 更改导航栏背景色
        if let color = selectedCategory?.color {
            title = selectedCategory!.name
            guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}
            if let navBarColor = UIColor(hexString: color) {
                navBar.barTintColor = navBarColor
                navBar.tintColor = ContrastColorOf(navBarColor, returnFlat: true)
                navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(navBarColor, returnFlat: true)]
                searchBar.tintColor = navBarColor
            }
        }
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let oldItem = self.items?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(oldItem)
                }
            } catch {
                print("Error deleting item: \(error)")
            }
        }
    }
    
    // Add Items
    @IBAction func addButtonPressed(_ sender: Any) {
        // 输入的信息
        var textField = UITextField()
        // 警报信息
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        //
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
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
    
    // Realm
    func loadItems() {
        items = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
    }
}

// MARK: -  TableView Methods

extension ToDoListViewController {
    // 设置行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 1
    }
    // 设置行内信息
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        // 设置表格每一行的文本内容
        if let item = items?[indexPath.row] {
            cell.textLabel?.text = item.title
            
            if let color = UIColor(hexString: selectedCategory!.color)?.darken(byPercentage:   CGFloat(indexPath.row) / CGFloat(items!.count)) {
                cell.backgroundColor = color
                // 设置文本颜色对比
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
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
        
        // 取消选择的行。点击后，变成灰色又迅速变回白色
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchBarDelegate
extension ToDoListViewController: UISearchBarDelegate {
    // 输入文本后点击
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
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

