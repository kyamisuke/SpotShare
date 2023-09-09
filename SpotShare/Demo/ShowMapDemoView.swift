//
//  ShowMapDemoView.swift
//  SpotShare
//
//  Created by 村上航輔 on 2023/09/09.
//

import SwiftUI
import MapKit

struct ShowMapDemoView: View {
    @State var searchResults: [MKMapItem] = []
    
    var pointList = [
        Annotation(latitude: 35.709152712026265, longitude: 139.80771829999996),
        Annotation(latitude: 35.711554715026265, longitude: 139.81371829999996),
        Annotation(latitude: 35.712527719026265, longitude: 139.81071829999996)
    ]
    
    @State  var region = MKCoordinateRegion(
        center : CLLocationCoordinate2D(
            latitude: 35.710057714926265,  // 緯度
            longitude: 139.81071829999996 // 経度
        ),
        latitudinalMeters: 1000.0, // 南北
        longitudinalMeters: 1000.0 // 東西
    )
    @State var isLoading: Bool = false
    
    var body: some View {
        // 地図を表示
        ZStack {
            VStack {
                Map(coordinateRegion: $region,
                    interactionModes: .zoom,
                    annotationItems: searchResults,
                    annotationContent: { point in MapMarker(coordinate: point.placemark.coordinate, tint: .orange)})
                .edgesIgnoringSafeArea(.bottom)
                
                Button {
                    Task {
                        isLoading = true
                        await search(for: "station")
                        isLoading = false
                    }
                } label: {
                    Label("Playgrounds", systemImage: "figure.and.child.holdinghands")
                }
                .buttonStyle(.borderedProminent)
            }
            
            ZStack {
//                Rectangle()
//                    .foregroundColor(.white)
                // アクセントカラーなどを指定してカスタマイズできる
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding()
                    .tint(Color.white)
                    .background(Color.gray)
                    .cornerRadius(8)
                    .scaleEffect(1.2)
            }
            .opacity(isLoading ? 1 : 0)
        }
    }
    
    func search(for query: String) async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = region
        
        let search = MKLocalSearch(request: request)
        let response = try? await search.start()
        searchResults = response?.mapItems ?? []
    }
}

struct ShowMapDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMapDemoView()
    }
}
