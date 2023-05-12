//
//  File.swift
//  
//
//  Created by Ana Raiany Guimarães Gomes on 2023-05-11.
//

import Foundation

/// A utility class that provides functions to manipulate datasets.
class DataUtility {
    /**
     Splits a dataset into two arrays: one for training and one for testing.
     - Parameters:
        - dataset: The dataset to split.
        - trainingFactor: The fraction of the dataset to be used for training.
     - Returns: A tuple containing two arrays: the training array and the test array.
     */
    static func splitDataset<T>(_ dataset: [T], trainingFactor: Double = 0.5) -> ([T], [T]) {
        let trainingCount = Int(Double(dataset.count) * trainingFactor)
        let trainingData = Array(dataset.prefix(trainingCount))
        let testData = Array(dataset.suffix(dataset.count - trainingCount))
        return (trainingData, testData)
    }
}
