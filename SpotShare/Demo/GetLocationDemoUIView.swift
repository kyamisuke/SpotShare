//
//  GetLocationDemoUIView.swift
//  SpotShare
//
//  Created by 村上航輔 on 2023/09/09.
//

import SwiftUI
import MapKit

struct GetLocationDemoUIView: View {
    @ObservedObject  var manager = LocationManager()
    
    var body: some View {
        VStack {
            Text("\(manager.region.center.latitude) : \(manager.region.center.longitude)")
            Button {
                manager.reloadRegion()
            } label: {
                Text("位置取得")
            }
        }
    }
}

struct GetLocationDemoUIView_Previews: PreviewProvider {
    static var previews: some View {
        GetLocationDemoUIView()
    }
}
