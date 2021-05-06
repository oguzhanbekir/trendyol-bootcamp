//
//  SelectLocationOnMapVC.swift
//  FindMapAddress
//
//  Created by Oguzhan Bekir on 2.05.2021.
//

import UIKit
import MapKit
import CoreLocation

final class SelectLocationOnMapVC: UIViewController {

    @IBOutlet weak private var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.tintColor = .orange
        checkLocationServices()
    }
    
    func setupLocationManager() {
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
       
   func showUserLocationCenterMap() {
       if let location = locationManager.location?.coordinate {
           let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
           mapView.setRegion(region, animated: true)
       }
   }

   func checkLocationServices() {
       if CLLocationManager.locationServicesEnabled() {
           //TODO:
           setupLocationManager()
           checkLocationAuth()
       } else {
           //Kullanıcıya bir alert göterip, ayarlardan açmaya yönlendirebiliriz
           showAccessAlert()
           
       }
   }
       
   func showAccessAlert() {
    
        let alert = UIAlertController(title: "Hata", message: "Konum izinleri kapalı. Konum ayarlarını açmak ister misin?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { action in
            if let bundleId = Bundle.main.bundleIdentifier,
                let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
        }))
        self.present(alert, animated: true, completion: nil)
    
   }
       
   func checkLocationAuth() {
       switch CLLocationManager.authorizationStatus() {
       case .authorizedWhenInUse:
           listenLocation()
       case .denied:
           showAccessAlert()
       case .authorizedAlways:
           break
       case .notDetermined:
           locationManager.requestWhenInUseAuthorization()
       case .restricted:
           break
       }
   }
       
       //Kullanıcının konumunu izleme
   func listenLocation() {
       mapView.showsUserLocation = true
       showUserLocationCenterMap()
       locationManager.startUpdatingLocation()
       lastLocation = getCenterLocation(mapView: mapView)
   }
   
   //Haritanın merkezini hesaplama
   func getCenterLocation(mapView:MKMapView) -> CLLocation {
       let latitude = mapView.centerCoordinate.latitude
       let longitude = mapView.centerCoordinate.longitude
       return CLLocation(latitude: latitude, longitude: longitude)
   }
       
    @IBAction func saveButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Konumu Onayla", message: "Adresiniz haritada işaretlenen noktaya teslimat yapılacaktır. Konum işaretinin doğru olduğuna emin misiniz?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { action in
            if self.address !=  "" {
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                
                let viewController = storyboard.instantiateViewController(identifier: "verifyAddressViewController") as VerifyAddressVC
                
                self.navigationController?.pushViewController(viewController, animated: true)
                viewController.address = self.address
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
  
}

extension SelectLocationOnMapVC: CLLocationManagerDelegate {
   
   //location update durumu
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       guard let location = locations.last else { return }
       let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
       let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
       
       mapView.setRegion(region, animated: true)
   }
   
   //verilen izin kontrolü
   func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
       //TODO:
       checkLocationAuth()
   }
}

extension SelectLocationOnMapVC: MKMapViewDelegate {

    
   func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
       
       let center = getCenterLocation(mapView: mapView)
       let geoCoder = CLGeocoder()

       guard let lastLocation = lastLocation, center.distance(from: lastLocation) > 30 else { return }
       
       self.lastLocation = center
       
       geoCoder.reverseGeocodeLocation(center) { (placemarks, error) in
           
           guard let placemark = placemarks?.first else { return }
           
            let city = placemark.locality ?? ""
            let street = placemark.thoroughfare ?? ""
            let number = placemark.subThoroughfare ?? ""
            let district = placemark.subLocality ?? ""

            DispatchQueue.main.async {
                self.address = "\(city), \(district), \(street), No: \(number)"
                self.addressLabel.text = "\(city), \(district), \(street), No: \(number)"
            }
            
       }
   }
}
