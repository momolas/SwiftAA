<p align="center">
<b>SwiftAA</b> &bull;
<a href="https://github.com/onekiloparsec/aa-js">aa-js</a> &bull;
<a href="https://github.com/onekiloparsec/QLFits">QLFits</a>
</p>

SwiftAA
============

![](https://img.shields.io/badge/Swift-5.9%20%7C%206.0-blue.svg?style=flat)
![](https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20watchos%20%7C%20tvos%20%7C%20linux-lightgrey.svg)
![](https://img.shields.io/badge/licence-MIT-blue.svg)
[![CI](https://github.com/onekiloparsec/SwiftAA/actions/workflows/ci.yml/badge.svg)](https://github.com/onekiloparsec/SwiftAA/actions/workflows/ci.yml)

*The most comprehensive collection of accurate astronomical algorithms in modern Swift.* 

Other implementations: [C# (AASharp)](https://github.com/jsauve/AASharp), and [JavaScript (aa-js)](https://github.com/onekiloparsec/aa-js).

Description
=======

SwiftAA provides everything you need to build our Solar System, compute length of seasons, moon phases, determine rise, transit and set times, get positions of planetary moons, transform coordinates, determine physical details of planets, their illumination, distance, eclipses, calendars, etc., with professional-grade accuracy.

**SwiftAA is used in production apps**, including apps by [Vaonis](https://vaonis.com) (creators of smart telescopes like Stellina and Vespera) and [MeteorActive](https://itunes.apple.com/us/app/meteoractive/id1205712190?mt=8).

### Architecture & Direct C++ Interoperability

SwiftAA directly leverages **Swift 5.9+ C++ Interoperability (`.interoperabilityMode(.Cxx)`)** atop **AA+ v2.63**, the C++ implementation by P.J. Naughter of the reference textbook *Astronomical Algorithms* by Jean Meeus (2nd ed.). 

- **Zero-cost bridge**: Direct C++ calls with zero runtime wrapper overhead.
- **Swift 6 & Strict Concurrency ready**: Built with complete concurrency checking support.
- **Strong Unit Safety**: Type-safe structures for `Degree`, `ArcSecond`, `Hour`, `JulianDay`, `AstronomicalUnit`, `Kilometer`, etc.
- **High Test Coverage**: Comprehensive suite using both `XCTest` and modern `Swift-Testing` (`@Test`, `@Suite`).

---

Features & Examples
===================

### 1. Planets & Solar System Bodies

```swift
import SwiftAA

// Target date: standard J2000 epoch
let jd = JulianDay(year: 2024, month: 4, day: 8, hour: 18, minute: 17)

// Earth & Seasons
let earth = Earth(julianDay: jd)
let springLength = earth.lengthOfSeason(.spring, northernHemisphere: true) // 92.75 days

// Mars Physical & Apparent Coordinates
let mars = Mars(julianDay: jd)
let equatorial = mars.apparentEquatorialCoordinates
let phase = mars.phaseAngle()
let dist = mars.radiusVector // Distance to Sun in AU

// Moon & Phases
let moon = Moon(julianDay: jd)
let illFraction = moon.illuminatedFraction()
```

### 2. Solar & Lunar Eclipses

```swift
// Predict characteristics of a Solar Eclipse (k = lunation index)
let solarEclipse = Eclipses.calculateSolar(k: -82.0)
print(solarEclipse.isPartial) // true
print(solarEclipse.greatestMagnitude) // 0.735

// Predict characteristics of a Lunar Eclipse
let lunarEclipse = Eclipses.calculateLunar(k: -328.5)
print(lunarEclipse.hasEclipse) // true
print(lunarEclipse.umbralMagnitude)
```

### 3. Religious & Lunisolar Calendars

```swift
// Islamic / Hijri Calendar
let hijri = HijriDate(year: 1445, month: 9, day: 1) // Ramadan 1, 1445 AH
let gregorianDate = hijri.toGregorianCalendarDate()
print(hijri.isLeapYear)

// Hebrew / Jewish Calendar
let pesach = JewishDate.dateOfPesach(civilYear: 2024) // 15 Nisan
let isJewishLeap = JewishDate(year: 5784, month: 1, day: 1).isLeapYear

// Easter Sunday
let westernEaster = Easter.calculate(year: 2026, inGregorianCalendar: true)
let orthodoxEaster = Easter.calculate(year: 2026, inGregorianCalendar: false)
```

### 4. Lunar Standstills (Lunistices)

```swift
// Compute extreme Moon declination dates and values
let standstill = Moon.greatestDeclination(nearYear: 2024.5, northerly: true)
print(standstill.declination.formatted(.sexagesimal)) // "> +28°"
```

### 5. Comets & Parabolic Orbits

```swift
let elements = ParabolicOrbitElements(
    perihelionDistance: 1.324558.AU,
    inclination: 22.4111.degrees,
    argumentOfPerihelion: 130.6013.degrees,
    longitudeOfAscendingNode: 12.4403.degrees,
    jdEquinox: JulianDay(2447891.5),
    timeOfPerihelion: JulianDay(2447810.0)
)

let cometDetails = ParabolicOrbit.calculate(julianDay: JulianDay(2447891.5), elements: elements)
print(cometDetails.astrometricRightAscension.formatted(.rightAscension))
```

### 6. Atmospheric Air Mass & Observation Window

```swift
// Pickering (2002) optical air mass
let airMass = AtmosphericAirMass.pickeringAirMass(trueAltitude: 45.0.degrees)

// Assess night observability for telescope targeting
let observer = GeographicCoordinates(eastLongitude: 2.35.degrees, latitude: 48.85.degrees)
let horizontal = HorizontalCoordinates(azimuth: 180.0.degrees, altitude: 45.0.degrees, geographicCoordinates: observer, julianDay: jd)

let window = horizontal.observationWindow(sunAltitude: -20.0.degrees, minTargetAltitude: 30.0.degrees)
print(window.isOptimal) // true (target > 30° during dark night)
```

### 7. Modern Formatting & Foundation Interoperability

```swift
// Sexagesimal & Right Ascension FormatStyles
let dec = Degree(-15.4321)
dec.formatted(.sexagesimal) // "-15° 25' 55.56\""

let ra = Hour(12.5891)
ra.formatted(.rightAscension) // "12h 35m 20.76s"

// Foundation Measurement bridging
let mAngle: Measurement<UnitAngle> = 45.0.degrees.measurement
let mLength: Measurement<UnitLength> = 1.0.AU.measurement
```

---

Documentation
=============

SwiftAA includes full **Apple DocC** documentation. You can preview it in your browser with:

```bash
swift package --disable-sandbox preview-documentation --target SwiftAA
```

Or build the documentation in Xcode via **Product > Build Documentation**.

---

Installation
============

Add SwiftAA as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/onekiloparsec/SwiftAA.git", from: "3.0.1")
]
```

Or add it directly in Xcode via **File > Add Package Dependencies...** and search for `SwiftAA`.

---

AA+ Core
========

The AA+ framework, written in C++ by PJ Naughter (Visual C++ MVP), is the comprehensive implementation of the algorithms in Jean Meeus' reference textbook *Astronomical Algorithms*. 

SwiftAA integrates **AA+ v2.63** (released May 2025) directly as a C++ SPM module target (`AAplus`).

---

Caution on Coordinates
======================

Coordinates computations are key for modern astronomy. Note that classical Meeus algorithms are referenced to standard dynamical epochs (such as standard equinox FK5 J2000.0) rather than relativistic ICRS. For conversions requiring high-order relativistic stellar motions, refer also to packages like [AstroPy](http://docs.astropy.org/en/stable/coordinates/index.html).

---

Author
======

Cédric Foellmi, a.k.a. **[@onekiloparsec](https://twitter.com/onekiloparsec)** ([website](https://onekiloparsec.dev)). <br/>
(Ph.D. in astrophysics, and former *support astronomer* at the [European Southern Observatory](http://www.eso.org) in Chile). <br/> Author of the app iObserve for macOS and [arcsecond.io](https://www.arcsecond.io).

---

Licence
=======

The licence of this software is the [MIT](http://opensource.org/licenses/MIT) licence. The underlying AA+ Framework retains its own licence by PJ Naughter:

* You are allowed to include the source code in any product (commercial, shareware, freeware or otherwise) when your product is released in binary form.
* You are allowed to modify the source code in any way you want except you cannot modify the copyright details at the top of each module.
* If you want to distribute source code with your application, then you are only allowed to distribute versions released by the author.
