//
//  ViewController.swift
//  Challenge_Project
//
//  Created by Alex Paramonov on 9.03.22.
//

import UIKit

class ViewController: UITableViewController {
     
     var productList = [String]()
     
     override func viewDidLoad() {
          super.viewDidLoad()
          title = "Shoping List"
          navigationController?.navigationBar.prefersLargeTitles = true
          setRightItemButton()
          setleftButtonItem()
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          productList.count
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
          cell.textLabel?.text = productList[indexPath.row]
          return cell
     }
     
     
     private func setRightItemButton(){
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewProduct))
     }
     
     private func setleftButtonItem(){
          navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(removeList))
     }
     
     @objc func removeList(){
          productList.removeAll()
          tableView.reloadData()
     }
     
     
     @objc func addNewProduct(){
          let alertController = UIAlertController(title: "Enter Product", message: nil, preferredStyle: .alert)
          alertController.addTextField()
          alertController.addAction(UIAlertAction(title: "Add", style: .default, handler: { UIAlertAction in
               guard  let answer = alertController.textFields?[0].text else { return }
               if answer == "" {
                    self.ErrorAlert()
               } else {
                    self.productList.insert(answer, at: 0)
                    self.tableView.reloadData()
                    
               }
          }))
          present(alertController, animated: true)
     }
     
     private func ErrorAlert(){
          let alertController = UIAlertController(title: "textField is Empty", message: "add please product", preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "Ok", style: .default))
          present(alertController, animated: true)
     }
     
     
}

