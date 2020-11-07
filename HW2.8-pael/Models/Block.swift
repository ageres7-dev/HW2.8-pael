//
//   Block.swift
//  HW2.8-pael
//
//  Created by Dmitry Shcherbakov on 07.11.2020.
//

import Foundation


struct Block {
    let qualityProducer: String
    let qualityAdministrator: String
    let qualityEntrepreneurs: String
    let qualityIntegrator: String
}


extension Block {
    static func getBlocks() -> [Block] {
        let manager = DataManager.shared
        return manager.qualityOfProducers.enumerated().map() {
            Block(qualityProducer: $1,
                  qualityAdministrator: manager.qualityOfAdministrators[$0],
                  qualityEntrepreneurs: manager.qualityOfEntrepreneurs[$0],
                  qualityIntegrator: manager.qualityOfIntegrators[$0])
        }
        
    }
    
}

