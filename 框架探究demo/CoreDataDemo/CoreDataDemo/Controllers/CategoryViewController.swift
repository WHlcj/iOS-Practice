
import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    // CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadCategories()
    }

    // 添加按钮
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // 输入的信息
        var textField = UITextField()
        // 警报信息
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        // 取消按钮
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text ?? "New Category"
            self.categories.append(newCategory)
            // 保存数据
            self.saveCategories()
        }
        // 为警报添加文本输入框
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        // 添加警报
        alert.addAction(action)
        // 取消
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    // 页面跳转
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if #available(iOS 16.0, *) {
            let destinationVC = segue.destination as! ToDoListViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categories[indexPath.row]
            }
            
        } else {
            // Fallback on earlier versions
        }
    }

}

// MARK: - TableViewDelegate

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    // tableView的内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
}

// MARK: - CoreData Manipulation Methods

extension CategoryViewController {
    func saveCategories() {
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
            try context.save()
        } catch {
            print("Error saving data from context \(error)")
        }
        // 刷新视图
        self.tableView.reloadData()
    }
    
    func loadCategories() {
//         //NSCoder
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                items = try decoder.decode([Item].self, from: data)
//            } catch {
//                print("Error decoding item array, \(error)")
//            }
//        }
         //Core Data
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
    
}
