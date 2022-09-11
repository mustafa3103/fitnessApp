//
//  TraningsViewController.swift
//  Fitness App
//
//  Created by Mustafa on 30.08.2022.
//

import UIKit

class TraningsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var selectedTraning: [Tranings] = []
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.didload
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 75
        
    }
    
    //MARK: - Segue preparation.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSubTraining" {
            let vc = segue.destination as? subTraningViewController
            vc?.selectedTraing = selectedTraning[currentIndex]
        }
    }
}

//MARK: - TableView Datasource methods.
extension TraningsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let train = selectedTraning[indexPath.row]
        content.text = train.traningName
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedTraning.count
    }
}

//MARK: - TableView Delegate methods.
extension TraningsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Segue yap.
        currentIndex = indexPath.row
        performSegue(withIdentifier: "toSubTraining", sender: self)
    }
}
