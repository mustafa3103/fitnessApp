//
//  StepTargetViewController.swift
//  Fitness App
//
//  Created by Mustafa on 9.09.2022.
//

import UIKit
import HealthKit

class StepTargetViewController: UIViewController {
    
    var healthStore = HKHealthStore()
    var stepTargetPercentage: Float = 0.0

    @IBOutlet var currentStep: UILabel!
    @IBOutlet var stepProgress: UIProgressView!
    @IBOutlet var stepAdvice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Access step count
        let healthKitTypes: Set = [ HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!]
        
        //Check for authorization
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { bool, error in
            if bool {
                self.getSteps { (result) in
                    DispatchQueue.main.async {
                        let stepCount = Float(result)
                        
                        self.currentStep.text = String(Int(stepCount))
                        
                        if stepCount/Float(10000) >= 1.0 {
                            self.stepProgress.progress = 1.0
                            self.stepAdvice.text = "You completed 10.000 step target. Your total step is \(String(Int(stepCount)))"
                        }else {
                            self.stepProgress.progress = stepCount / Float(10000)
                            self.stepAdvice.text = "There is a left \(10000 - Int(stepCount)) step for achieving 10.000 step target. Run foster run !!!"
                        }
                    }
                }
            }
        }
    }
    
    func getSteps(completion: @escaping (Double) -> Void) {
        let type = HKQuantityType.quantityType(forIdentifier: .stepCount)!
            
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        var interval = DateComponents()
        interval.day = 1
        
        let query = HKStatisticsCollectionQuery(quantityType: type,
                                               quantitySamplePredicate: nil,
                                               options: [.cumulativeSum],
                                               anchorDate: startOfDay,
                                               intervalComponents: interval)
        
        query.initialResultsHandler = { _, result, error in
                var resultCount = 0.0
                result!.enumerateStatistics(from: startOfDay, to: now) { statistics, _ in

                if let sum = statistics.sumQuantity() {
                    // Get steps (they are of double type)
                    resultCount = sum.doubleValue(for: HKUnit.count())
                } // end if

                // Return
                DispatchQueue.main.async {
                    completion(resultCount)
                }
            }
        }
        
        query.statisticsUpdateHandler = {
            query, statistics, statisticsCollection, error in

            // If new statistics are available
            if let sum = statistics?.sumQuantity() {
                let resultCount = sum.doubleValue(for: HKUnit.count())
                // Return
                DispatchQueue.main.async {
                    completion(resultCount)
                }
            } // end if
        }
        
        healthStore.execute(query)
    }
}
