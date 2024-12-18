//
//  VenusTests.swift
//  SwiftAA
//
//  Created by Cédric Foellmi on 18/06/16.
//  MIT Licence. See LICENCE file.
//

import Foundation
import XCTest
@testable import SwiftAA

class VenusTests: XCTestCase {

    func testAverageColor() {
        XCTAssertNotEqual(Venus.averageColor, CelestialColor.white)
    }
    
    // See AA p.225
    func testApparentGeocentricCoordinates() {
        let venus = Venus(julianDay: JulianDay(year: 1992, month: 12, day: 20))
        AssertEqual(Hour(venus.allPlanetaryDetails.ApparentGeocentricRA), Hour(21.078181), accuracy: ArcSecond(0.1).inHours)
        AssertEqual(Degree(venus.allPlanetaryDetails.ApparentGeocentricDeclination), Degree(-18.88801), accuracy: ArcSecond(0.1).inDegrees)
    }
    
    // See AA p.284
    func testIlluminationFraction() {
        let venus = Venus(julianDay: JulianDay(year: 1992, month: 12, day: 20))
        XCTAssertEqual(venus.illuminatedFraction, 0.647, accuracy: 0.005)
    }
    
    // See AA p.225
    func testHeliocentricEclipticCoordinates() {
        let venus = Venus(julianDay: JulianDay(year: 1992, month: 12, day: 20), highPrecision: false)
        let heliocentricEcliptic = venus.heliocentricEclipticCoordinates
        AssertEqual(heliocentricEcliptic.celestialLatitude, Degree(-2.62070), accuracy: ArcSecond(0.1).inDegrees)
        AssertEqual(heliocentricEcliptic.celestialLongitude, Degree(26.11428), accuracy: ArcSecond(0.1).inDegrees)
        AssertEqual(venus.radiusVector, AstronomicalUnit(0.724603), accuracy: AstronomicalUnit(0.00001))
    }
    
    // See AA p.103
    func testGeocentricEquatorialCoordinates() {
        let venus = Venus(julianDay: JulianDay(year: 1988, month: 03, day: 20))
        let equatorial = venus.apparentGeocentricEquatorialCoordinates
        AssertEqual(equatorial.rightAscension.inDegrees, Degree(41.73129), accuracy: ArcSecond(0.1).inDegrees)
        AssertEqual(equatorial.declination, Degree(18.44092), accuracy: ArcSecond(0.1).inDegrees)
    }    
}
