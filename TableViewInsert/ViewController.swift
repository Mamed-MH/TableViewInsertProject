//
//  ViewController.swift
//  TableViewInsert
//
//  Created by Mamed Hacıyev on 17.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var studentNames: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "Welcome"
    }

    @IBAction func addButton(_ sender: Any) {
        
        let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SecondVc") as? SecondVc ?? SecondVc()
        navigationController?.pushViewController(controller, animated: true)
        
        controller.names = studentNames
        
        
        controller.callback = { list in
            
            self.studentNames = list
            self.tableView.reloadData()
            
            
            
        }
        
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell") as! NameCell
        let student = studentNames[indexPath.row]
        
        cell.nameLabel.text = student.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            studentNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
}
