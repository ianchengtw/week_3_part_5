//
//  StationModel.swift
//  youbike
//
//  Created by Ian on 4/25/16.
//  Copyright © 2016 AppWorks School Ian Cheng. All rights reserved.
//

import Foundation

struct Station {
    var title: String = ""
    var address: String = ""
    var remainingBikes: Int = 0
    var lat: Double = 0.0
    var lng: Double = 0.0
}

class StationModel {
    
    private var _stations = [Station]()
    var stations: [Station] { return self._stations }
    
    init() {
        // read json
        let url = NSBundle.mainBundle().URLForResource("youbike", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(dictionary)
            }
        } catch {
            // Handle Error
        }

    }
    
    func readJSONObject(object: [String: AnyObject]) {
        
        guard let stations = object["retVal"] as? [String: [String: String]] else { return }
        
        for (_, station) in stations {
            
            guard let sna = station["sna"] as? String!,
                let sSbi = station["sbi"] as? String!,
                let sbi = Int(sSbi),
                let ar = station["ar"] as? String!,
                let sLat = station["lat"] as? String!,
                let lat = Double(sLat),
                let sLng = station["lng"] as? String!,
                let lng = Double(sLng) else { continue }
            
            self._stations.append(
                Station(
                    title: sna,
                    address: ar,
                    remainingBikes: sbi,
                    lat: lat,
                    lng: lng
                )
            )
            
        }
    }

}