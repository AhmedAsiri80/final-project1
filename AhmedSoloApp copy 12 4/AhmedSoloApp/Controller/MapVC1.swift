//
//  MapVC1.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 10/05/1443 AH.
//

import Foundation

import UIKit
import MapKit


class locationVC: UIViewController {
    
    
    let  mapView : MKMapView = {
        
        let map = MKMapView()
        
        map.overrideUserInterfaceStyle = .dark
        
        return map
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapConstraints()
        
    }
    
    func setMapConstraints() {
        view.addSubview(mapView)
        
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        
        let Location = MKPointAnnotation()
        Location.title = "فرع وزارة الشؤون الاسلامية والدعوه والارشاد"
        Location.coordinate = CLLocationCoordinate2D(latitude: 18.3387934, longitude: 42.7372522)
        
        mapView.addAnnotation(Location)
        
        
        let ALocation = MKPointAnnotation()
        ALocation.title = "ادارةالمساجد بمنطقة عسير "
        ALocation.coordinate = CLLocationCoordinate2D(latitude: 18.2105144, longitude: 42.5313921)
        
        mapView.addAnnotation(ALocation)
        
        let BLocation = MKPointAnnotation()
        BLocation.title = "المسجد الحرام"
        BLocation.coordinate = CLLocationCoordinate2D(latitude: 21.4225687, longitude: 39.8265271)
        
        mapView.addAnnotation(BLocation)
        
        
        let ABLocation = MKPointAnnotation()
        ABLocation.title = "المسجد النبوي "
        ABLocation.coordinate = CLLocationCoordinate2D(latitude: 24.4684501, longitude: 39.6110284)
        
        mapView.addAnnotation(ABLocation)
    }
}
