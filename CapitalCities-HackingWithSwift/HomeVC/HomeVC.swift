//
//  HomeVC.swift
//  CapitalCities-HackingWithSwift
//
//  Created by Mert Deniz Akbaş on 23.08.2023.
//

import UIKit
import MapKit

protocol HomeVCProtocol: AnyObject {
    func configureCapital()
}

final class HomeVC: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!
    private var viewModel = HomeViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()

    }
}

extension HomeVC: HomeVCProtocol {
    func configureCapital() {
        let capitals = [
            MapModel(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: 0.1275), info: "Home to the 2012 Summer Olympics."),
            MapModel(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago."),
         MapModel(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light."),
        MapModel(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it."),
         MapModel(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself."),
         MapModel(title: "Ankara", coordinate: CLLocationCoordinate2D(latitude: 39.9334, longitude: 32.8597), info: "City of La Angara"),
            ]
        capitals.forEach { mapView.addAnnotation($0) }
    }
}

extension HomeVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard  annotation is MapModel else { return nil }
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            let detailButton = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = detailButton
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? MapModel else { return }
        let placeTitle = capital.title
        let placeInfo = capital.info
        let ac = UIAlertController(title: placeTitle, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

