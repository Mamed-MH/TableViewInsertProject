//
//  SecondVc.swift
//  TableViewInsert
//
//  Created by Mamed Hacıyev on 17.12.2024.
//

import UIKit

class SecondVc: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    var names = [Item]()
    
    var callback: (([Item]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        textField.delegate = self
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        if let text = textField.text {
            names.append(Item(name: text))
            
            callback?(names)
            
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

extension SecondVc: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? true {
            
            textField.textColor = .cyan
            textField.layer.borderWidth = 1
        } else {
            textField.textColor = .red
            textField.layer.borderWidth = 1
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
