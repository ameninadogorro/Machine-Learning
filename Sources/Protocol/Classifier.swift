//
//  Classifier.swift
//  ML-Estudos
//
//  Created by Ana Raiany Guimarães Gomes on 2023-05-11.
//

import Foundation
import simd


/// Protocolo que define as regras do que um classificador de machine learning deve ter.
protocol Classifier {
    /// Conjunto de dados divididos em dados usados para treinar e testar o modelo.
    var splitedDataset: ([Iris], [Iris]) { get }
    /// Chama a implementação de treino do classificador.
    func train()
    /**
     Chama a implementação de previsão do classificador.
      - Parameter testInstance: Valor a ser previsto.
      - Returns: uma String referente à classe que foi prevista.
     */
    func predict(_ testInstace: SIMD4<Double>) -> String
}
