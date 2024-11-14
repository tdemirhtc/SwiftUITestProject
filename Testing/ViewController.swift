//
//  ViewController.swift
//  Testing
//
//  Created by Hatice Taşdemir on 10.11.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var toDoList = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [], with: .automatic)
        }
    }

    @IBAction func addClicked(_ sender: Any) {
        //clicke tıklandığında bir mesaj görünecek
        let alert = UIAlertController(title: "Add item", message: "enter your to do item", preferredStyle: .alert)
        //textfield olacak orada da bu yazcak
        alert.addTextField{ textField in
            textField.placeholder = "Enter Item"
        }
        let okButton = UIAlertAction(title: "ok", style: .default) { action in
            //ok butona tıklanınca ne olacağı: textfieldın ilk elemanı göster, input text text fielda eşitse, inputtext boş değilse return et
            guard let textField = alert.textFields?[0], let inputText = textField.text, !inputText.isEmpty else{
                return
            }
            //append en sona ekler. en son eklenen ilk başta çıksın diye insert dememeiz lazım.
            self.toDoList.insert(inputText, at: 0)
            //reload data demiyoruz en başa eklenmesini istediğimiz için. indexpath istiyor ama addclicked de yok. eğer indexpath ister ve ulaşamazsak .init diyip ilk yere bunu git koy diyoruz row sectiona 0 vererek.
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }
        alert.addAction(okButton)
        //ekranda görüntülemek için kullanılır.
        self.present(alert, animated: true)
        
    }
    
}

