//
//  DataManager.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.
//

import Foundation

class DataManager {
    
    static var shared = DataManager()
    
    let qualityOfProducers = ["Отзывчивый", "Харизматичный"]
    let qualityOfAdministrators = ["Вовлеченный", "Анализирующий"]
    let qualityOfEntrepreneurs = ["Сомневающийся", "Чувствующий"]
    let qualityOfIntegrators = ["Яркий", "Прямой"]
    
    private init() {}
    
}
