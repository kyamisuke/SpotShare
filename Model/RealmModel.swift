//
//  RealmModel.swift
//  SpotShare
//
//  Created by 村上航輔 on 2023/09/10.
//

import Foundation
import RealmSwift
import MapKit

class Room: Object {
    @Persisted var uuid: UUID
    @Persisted var password: String?
    @Persisted var user = List<User>()
}

class User: Object {
    @Persisted var name = ""
    @Persisted var latitude: Double?
    @Persisted var longitude: Double?
    var isValid: Bool {
        get {
            return latitude != nil && longitude != nil
        }
    }
}
