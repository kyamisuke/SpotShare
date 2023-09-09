//
//  MapKitEx.swift
//  SpotShare
//
//  Created by 村上航輔 on 2023/09/09.
//

import Foundation
import MapKit

extension MKMapItem : Identifiable {
    public var id: UUID {
        get {
            return UUID()
        }
    }
}
