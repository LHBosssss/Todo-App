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
    
    var categorys = [Category]()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - TableView Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categorys[indexPath.row].name
        return cell
    }
    
    //MARK: - TableView Delegate
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
}

