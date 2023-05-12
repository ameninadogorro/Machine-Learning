//
//  Iris.swift
//  ML-Estudos
//
//  Created by Ana Raiany Guimarães Gomes on 2023-05-11.
//

import Foundation

struct Iris: Decodable {
    let id: Int
    let sepalLength: Double
    let sepalWidth: Double
    let petalLength: Double
    let petalWidth: Double
    let species: String
    
    var vector: [Double] {
        return [sepalLength, sepalWidth, petalLength, petalWidth]
    }
    
    static func loadDataset() -> [Iris] {
        guard let url = Bundle.main.url(forResource: "iris", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let irisData = try? JSONDecoder().decode([Iris].self, from: data) else {
            return []
        }
        return irisData
    }
}
