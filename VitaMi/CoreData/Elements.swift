//
//  ElementsList.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import FirebaseFirestoreSwift
import Foundation

struct Element: Identifiable, Codable {
    @DocumentID var id: String?
    let symbol: String
    let enName: String
    let ruName: String
    let type: String
    let elementInfo: String
    let elementInfoEn: String
    let enProductInfo: Array<String>
    let ruProductInfo: Array<String>
    let normalValue: Array<Double>
    let value: Double
    let measure: String
    let helper: Array<String>
    let blocker: Array<String>
}
