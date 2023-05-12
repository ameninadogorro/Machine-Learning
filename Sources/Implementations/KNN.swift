//
//  KNN.swift
//  ML-Estudos
//
//  Created by Ana Raiany Guimarães Gomes on 2023-05-11.
//

import Foundation
import simd

class KNN: Classifier {
    var splitedDataset: ([Iris], [Iris])
    private(set) var trainingData: [Iris] = []
    var k: Int
    
    init(k: Int, splitedDataset: ([Iris], [Iris])) {
        self.k = k
        self.splitedDataset = splitedDataset
    }
    
    func train() {
        trainingData = splitedDataset.0
    }
    
    func predict(_ testInstance: SIMD4<Double>) -> String {
        let distances = trainingData.map { trainingElement -> (Iris, Double) in
            let distance = simd_distance(testInstance, trainingElement.vector!)
            return (trainingElement, distance)
        }
        .sorted { $0.1 < $1.1 }
        
        let neighbors = Array(distances.prefix(k)).map { $0.0 }
        
        let countSpecies = neighbors.reduce(into: [:]) { counts, iris in
            let species = iris.species.rawValue
            counts[species, default: 0] += 1
        }
        
        return countSpecies.sorted { $0.1 > $1.1 }.first!.key
    }
}

