

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    // To Fix
    var lat = 43.6532
    var long = -79.3832
    var delta = 0.5
    let mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)

    @IBOutlet weak var latText: UITextField!
    @IBOutlet weak var lonText: UITextField!
    @IBOutlet weak var magText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let loc = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(delta, delta)
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg

        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Toronto"
        ann.subtitle = "A place that's really cool"
        self.map.addAnnotation(ann)
        
    }

    @IBAction func search(_ sender: UIButton) {
        let long = Float(self.lonText.text!)
        let lat = Float(self.latText.text!)
        let mag = Float(self.magText.text!)
        let loc = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat!), longitude: CLLocationDegrees(long!))
        let span = MKCoordinateSpanMake(CLLocationDegrees(mag!), CLLocationDegrees(mag!))
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg
        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Search"
        ann.subtitle = "A place that's really cool"
        self.map.addAnnotation(ann)
    }
    
    @IBAction func seeInMapApp(_ sender: UIButton) {
        let placemark = MKPlacemark(coordinate: self.mapLocation, addressDictionary: nil)
        let mapitem = MKMapItem(placemark: placemark)
        mapitem.name = "A really icy place"
        
        // opens our location in the map app
        mapitem.openInMaps(launchOptions: [
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.map.region.center,
            MKLaunchOptionsMapSpanKey: self.map.region.span
            ])
    }
    

}

