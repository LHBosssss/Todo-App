//
//  CategoryTableViewController.swift
//  Todo
//
//  Created by Ho Duy Luong on 4/13/20.
//  Copyright © 2020 Ho Duy Luong. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var categories = [Category]()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCategoryCell")
        
        loadData()
    }
    
    //MARK: - TableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCategoryCell", for: indexPath) as! TableViewCell
        print(cell)
        print("Cell: \(cell.categoryCell.text)")
        print("Array: \(categories[indexPath.row].name)")
        cell.categoryCell.text = categories[indexPath.row].name!
        return cell
    }
    
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoAppViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    
    
    //MARK: - Alert Add
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        var categoryTF = UITextField()
        let action = UIAlertAction(title: "Add Category", style: .default) { action in
            if let text = categoryTF.text {
                let categoryCell = Category(context: self.context)
                categoryCell.name = text
                self.categories.append(categoryCell)
                print(self.categories.first?.name!)
                self.saveData()
                print(self.categories)
            }
        }
        alert.addAction(action)
        alert.addTextField { userType in
            userType.placeholder = "Enter New Category"
            categoryTF = userType
        }
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Save Data To CoreData
    func saveData() -> Void {
        do {
            try context.save()
        } catch {
            print("Error when Saving data to CoreData: \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData(request: NSFetchRequest<Category> = Category.fetchRequest()) -> Void {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Load Data error: \(error)")
        }
        tableView.reloadData()
    }
    
}

