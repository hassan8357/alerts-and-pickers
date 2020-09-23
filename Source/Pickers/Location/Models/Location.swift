import Foundation
import CoreLocation
import Contacts

// class because protocol
class Location: NSObject {
	let name: String?
	
	// difference from placemark location is that if location was reverse geocoded,
	// then location point to user selected location
	let location: CLLocation
	let placemark: CLPlacemark
	
	var address: String {
        if let postalAddress = placemark.postalAddress {
            let formatter = CNPostalAddressFormatter()
            formatter.style = .mailingAddress
            return formatter.string(from: postalAddress)
        } else {
            return "\(coordinate.latitude), \(coordinate.longitude)"
        }
	}
	
	init(name: String?, location: CLLocation? = nil, placemark: CLPlacemark) {
		self.name = name
		self.location = location ?? placemark.location!
		self.placemark = placemark
	}
}

import MapKit

extension Location: MKAnnotation {
    
    @objc var coordinate: CLLocationCoordinate2D {
		return location.coordinate
	}
	
    var title: String? {
		return address
	}
}
