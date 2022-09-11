//
//  subTraningViewController.swift
//  Fitness App
//
//  Created by Mustafa on 4.09.2022.
//

import UIKit

class subTraningViewController: UIViewController {

    @IBOutlet var trainingTitle: UILabel!
    @IBOutlet var traningInfo: UITextView!
    @IBOutlet var playImage: UIImageView!
    
    var selectedTraing: Tranings?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        trainingTitle.text = selectedTraing?.traningName
        traningInfo.text = selectedTraing?.traningExplanation
        
        playImage.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playButtonPressed))
        playImage.addGestureRecognizer(imageTapRecognizer)
    }

    @objc func playButtonPressed() {
        performSegue(withIdentifier: "toShowVideo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowVideo" {
            let vc = segue.destination as! showVideoViewController
            if let selectedTraing = selectedTraing {
                vc.urlString = selectedTraing.videoUrl
            }
           
        }
    }
}
