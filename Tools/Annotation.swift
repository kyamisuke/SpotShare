//
//  Annotation.swift
//  SpotShare
//
//  Created by 村上航輔 on 2023/09/09.
//

import Foundation
import MapKit

struct Annotation: Identifiable {
    let id = UUID()
    let latitude: Double // 緯度
    let longitude: Double // 経度
    // 座標
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
