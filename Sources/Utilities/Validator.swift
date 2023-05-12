//
//  File 2.swift
//  
//
//  Created by Ana Raiany Guimarães Gomes on 2023-05-11.
//

import Foundation

/// A utility class used to validate the efficiency of a classifier that implements the `Classifier` protocol.
final class Validator {
    /**
     Validates the efficiency of a classifier using a test dataset.
     
     - Parameters:
        - classifier: The instance of a classifier that conforms to the `Classifier` protocol.
        - testDataset: The test dataset used to classify the data.
     
     - Returns: The efficiency of the classifier using the following equation: `(hits/expectedData)`.
     */
    static func validateClassifier<T: Classifier>(classifier: T, testDataset: [Iris]) -> Double {
        classifier.train()
        var hits = 0
        
        hits = testDataset.filter { testInstance in
            let expected = testInstance.species.rawValue
            let predicted = classifier.predict(testInstance.vector)
            return predicted == expected
        }.count

        let percent = Double(hits) / Double(testDataset.count)
        return percent
    }
}
