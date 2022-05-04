//
//  MapViewController.swift
//  AnimalTracker
//
//  Created by Askar on 03.05.2022.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    var timer = Timer()
    var cowList: [Cow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyA1NaN8sstWrMqkgeef_gaKzPJCctJcuWg")
        
        view.backgroundColor = .systemBackground
        
        cowList = Cow.generateCows()
        
        configureNavBar()
        getLocation()
        
//        self.timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: {_ in self.fetchLocation()
//        })
    }

    //MARK: - Data Fetching Methods
    
    private func fetchLocation() {
        let stringURL = "https://api.thingspeak.com/channels/1669927/feeds.json?api_key=JR5OJ9ADRWDSSNSE&results=1"
        guard let url = URL(string: stringURL) else {fatalError("No URL was found!")}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {fatalError()}
            do {
                let location = try JSONDecoder().decode(LocationResponse.self, from: data)
                DispatchQueue.main.async {
                    self.getLocation(
                        id: location.feeds[0].entry_id,
                        lat: location.feeds[0].field1,
                        lon: location.feeds[0].field2
                    )
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private func getLocation(id: Int = 1, lat: String = "43.2081958111", lon: String = "76.6692038362") {
        let camera = GMSCameraPosition.camera(withLatitude: Double(lat) ?? 0, longitude: Double(lon) ?? 0, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: Double(lat) ?? 0, longitude: Double(lon) ?? 0)
        marker.title = "Animal \(id)"
        marker.map = mapView
    }
    
    private func configureNavBar() {
        
        navigationController?.title = "Cows"
        navigationController?.navigationBar.tintColor = .label
    }
}
