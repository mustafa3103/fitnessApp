//
//  Programs.swift
//  Fitness App
//
//  Created by Mustafa on 27.08.2022.
//

import Foundation
import UIKit

struct Programs {
    let title: String
    let programName: String
    let image: UIImage
    let traning: [Tranings]
}

let program: [Programs] = [Programs(title: "Arka Kol", programName: "arkaKol", image: #imageLiteral(resourceName: "arkakol"), traning: arkaKol), Programs(title: "Ön Kol", programName: "onKol", image: #imageLiteral(resourceName: "onkol"), traning: onKol), Programs(title: "Sırt", programName: "back",image: #imageLiteral(resourceName: "sirt"), traning: back), Programs(title: "Göğüs", programName: "chest",image: #imageLiteral(resourceName: "chest"), traning: chest), Programs(title: "Omuz", programName: "shoulder",image: #imageLiteral(resourceName: "shoulder"), traning: shoulder), Programs(title: "Bacak",programName: "leg", image: #imageLiteral(resourceName: "leg"), traning: leg), Programs(title: "Bilek", programName: "bilek",image: #imageLiteral(resourceName: "bilek"), traning: bilek)]
