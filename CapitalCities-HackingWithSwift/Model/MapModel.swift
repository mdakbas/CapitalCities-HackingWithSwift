//
//  MapModel.swift
//  CapitalCities-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 23.08.2023.
//

import UIKit
import MapKit

class MapModel: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
    
    

}
