//
//  HomeViewController.swift
//  Chatty
//
//  Created by Anh Son Le on 10/2/18.
//  Copyright © 2018 Anh Son Le. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class HomeViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Declare
    
    let manager = CLLocationManager.init()
    
    // MARK: - Define
    
    let idCellNewThinh = "idNewThinh"
    let idCellThinh = "idThinh"
    
    // MARK: - Set up
    
    func setupInitLocationMap() {
        guard let location = manager.location else {
            mapView.animate(to: GMSCameraPosition.init(target: CLLocationCoordinate2D.init(latitude: 21, longitude: 105), zoom: 15.3, bearing: 0, viewingAngle: 0))
            return
        }
        mapView.animate(to: GMSCameraPosition.init(target: CLLocationCoordinate2D.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), zoom: 15.3, bearing: 0, viewingAngle: 0))
    }
    
    func setupMap() {
        mapView.delegate = self
        mapView.isUserInteractionEnabled = false
        do {
            if let styleURL = Bundle.main.url(forResource: "light_simple_map", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                print("Not found JSON style file")
            }
        } catch {
            print("Faild to load JSON style map")
        }
    }
    
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupLayout() {
        mapView.padding = UIEdgeInsets.init(top: 0, left: 0, bottom: collectionView.frame.size.height, right: 0)
    }
    
    // MARK: - Life's view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        requestLocation()
        setupCollection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayout()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
    }

}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let location = manager.location else {
                return
            }
            mapView.animate(with: GMSCameraUpdate.setTarget(location.coordinate))
            break
        case .denied:
            break
        case .notDetermined, .restricted:
            break
        default:
            break
        }
    }
}

extension HomeViewController: GMSMapViewDelegate {
    func mapViewSnapshotReady(_ mapView: GMSMapView) {
        setupInitLocationMap()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCellNewThinh, for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCellThinh, for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 93, height: 128)
    }
    
}
