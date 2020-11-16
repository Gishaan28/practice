//
//  TableViewController.swift
//  practice
//
//  Created by Ishaan Gupta 2 on 11/14/20.
//

import UIKit
import CoreData

class TableViewController: UIViewController {

  private let tableView = UITableView()
  private let sNum = "Serial Number"
  private let name = "name"
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  private var itemArray = [Item]()
  override func viewDidLoad() {
      super.viewDidLoad()
      setupTableView()
//    storeDataInUserDefaults()
//    printDataFromUserDefaults()
    
//    let newItem = Item(context: context)
//    newItem.title = "James Bond"
//    newItem.number = 12
//    saveItem()
//    loadData()
//    updateData()
//    saveItem()
//    loadData()
//    deleteData()
//    loadData()
    print("Yes")
  }
  
  func saveItem() {
    do {
      try context.save()
      print("Item saved")
    } catch {
      print("Error save content \(error)")
    }
  }
  
  func loadData() {
    let request: NSFetchRequest<Item> = Item.fetchRequest()
    do {
      itemArray = try context.fetch(request)
      print("ItemArray \(itemArray.count)")
    } catch {
      print("fgetch error \(error)")
    }
  }
  
  func updateData() {
    itemArray[0].title = "James Bond 2"
  }
  
  func deleteData() {
//    itemArray.remove(at: 0)
    context.delete(itemArray[0])
    saveItem()
  }
  
  func printDataFromUserDefaults() {
    print("S. No. \(UserDefaults.standard.integer(forKey: sNum)) and name \(UserDefaults.standard.string(forKey: name) ?? "")")
  }
  
  func storeDataInUserDefaults() {
    UserDefaults.standard.setValue(1, forKey: sNum)
    UserDefaults.standard.setValue("James Bond", forKey: name)
    print("Data added to user defaults")
  }
  
  func setupTableView() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//    tableView.backgroundColor = .yellow
  }
}

//MARK:- TableView Delegate

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = "Yo Yo Honey Singh"
    cell.backgroundColor = .blue
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("row select \(indexPath.row)")
  }
  
}
