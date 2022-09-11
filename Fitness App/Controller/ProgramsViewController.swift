//
//  ProgramsViewController.swift
//  Fitness App
//
//  Created by Mustafa on 27.08.2022.
//

import UIKit

class ProgramsViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var selectedProgram: [Tranings] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Segue preparation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTranings" {
            let vc = segue.destination as? TraningsViewController
            vc?.selectedTraning = selectedProgram
        }
    }
}

//MARK: - CollectionView Delegate methods.
extension ProgramsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedProgram = program[indexPath.row].traning
        performSegue(withIdentifier: "toTranings", sender: self)
    }
}

//MARK: - CollectionView Datasource methods.
extension ProgramsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! FitnessCollectionViewCell
        
        cell.textLabelCollection.text = program[indexPath.row].title
        cell.imageViewCollection.image = program[indexPath.row].image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return program.count
    }
}
