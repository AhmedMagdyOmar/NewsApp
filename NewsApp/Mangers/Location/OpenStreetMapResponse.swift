////
////  OpenStreetMapResponse.swift
////  Bro-Rider
////
////  Created by Youssef on 08/02/2023.
////
//
//import Foundation
//
//struct RouteScreenData {
//    let duration: Double
//    let distance: Double
//    let geometry: [LocationResponse]
//    
//    init(model: OpenStreetMapResponse) {
//        
//        let leg = model.routes?.first?.legs?.first
//        var steps: [Step] = []
//        
//        var coordinates: [[Double]] = []
//
//        leg?.steps.unwrapped(or: []).forEach({
//            steps.append($0)
//        })
//        
//        steps.forEach({
//            $0.geometry?.coordinates?.forEach({
//                coordinates.append($0)
//            })
//        })
//        
//        geometry = coordinates.map({ item in
//            let lng = item.first
//            let lat = item.last
//            return LocationResponse(lat: lat, lng: lng, location: nil, address: nil)
//        })
//        
//        print(geometry.count)
//        
//        duration = leg?.duration ?? 0
//        distance = leg?.distance ?? 0
//        
//        print(duration, distance)
//    }
//}
//
//// MARK: - Welcome
//struct OpenStreetMapResponse: Codable {
//    let code: String?
//    let routes: [RouteOpenStreet]?
//}
//
//// MARK: - RouteOpenStreet
//struct RouteOpenStreet: Codable {
//    let geometry: Geometry?
//    let legs: [LegOpenStreet]?
//    let weightName: String?
//    let weight, duration, distance: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case geometry, legs
//        case weightName = "weight_name"
//        case weight, duration, distance
//    }
//}
//
//// MARK: - LegOpenStreet
//struct LegOpenStreet: Codable {
//    let steps: [Step]?
//    let summary: String?
//    let weight, duration, distance: Double?
//}
//
//// MARK: - Step
//struct Step: Codable {
//    let geometry: Geometry?
//    let maneuver: Maneuver?
//    let name: String?
//    let intersections: [Intersection]?
//    let weight, duration, distance: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case geometry, maneuver
//        case name, intersections, weight, duration, distance
//    }
//}
//
//
//// MARK: - Intersection
//struct Intersection: Codable {
//    let out: Int?
//    let entry: [Bool]?
//    let bearings: [Double]?
//    let location: [Double]?
//    let intersectionIn: Double?
//    let lanes: [Lane]?
//    
//    enum CodingKeys: String, CodingKey {
//        case out, entry, bearings, location
//        case intersectionIn = "in"
//        case lanes
//    }
//}
//
//// MARK: - Lane
//struct Lane: Codable {
//    let valid: Bool?
//    let indications: [String]?
//}
//
//// MARK: - Maneuver
//struct Maneuver: Codable {
//    let bearingAfter, bearingBefore: Double?
//    let location: [Double]?
//    let type: String?
//    let modifier: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case bearingAfter = "bearing_after"
//        case bearingBefore = "bearing_before"
//        case location, type, modifier
//    }
//}
//// MARK: - Location
//struct PickupPointLocationResponse: Codable {
//    let id: Int?
//    let lat, lng: Double?
//    let location: String?
//}
