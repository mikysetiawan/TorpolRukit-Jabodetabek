//
//  DetailViewController.swift
//  TorpolRukit Jabodetabek
//
//  Created by Miky Setiawan on 19/04/20.
//  Copyright © 2020 Miky Technology. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var descDetail: UILabel!
    
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    
    // Digunakan untuk menampung data Hero
    var tableAdapter: TableViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Digunakan untuk menetapkan nilai ke beberapa view yang ada
        if let result = tableAdapter {
            //Default coordinat monas
            let lat = Double(result.lat) ?? -6.175419
            let lon = Double(result.lon) ?? 106.827164
            let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = result.title
            let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
            mapView.setRegion(coordinateRegion, animated: true)
            mapView.addAnnotation(annotation)
            
            imageDetail.image = result.photo
            titleDetail.text = result.title
            descDetail.text = "Alamat : " + result.address + "\n" + result.description
        }
    }

}
