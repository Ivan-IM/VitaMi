//
//  SymtomList.swift
//  VitaMi
//
//  Created by Иван Маришин on 03.07.2021.
//

import FirebaseFirestoreSwift

struct Symptom: Identifiable, Codable {
    @DocumentID var id: String?
    let enName: String
    let ruName: String
    let elements: Array<String>
}

struct VersionFB: Identifiable, Codable {
    @DocumentID var id: String?
    let version: Double
}
