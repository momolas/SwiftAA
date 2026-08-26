<p align="center">
<b>SwiftAA</b> &bull;
<a href="https://github.com/onekiloparsec/aa-js">aa-js</a> &bull;
<a href="https://github.com/onekiloparsec/QLFits">QLFits</a> &bull;
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

SwiftAA provides everything you need to build our Solar System, compute length of seasons, moon phases, determine rise, transit and set times, get positions of planetary moons, transform coordinates, determine physical details of planets, their illumination, distance, etc., with professional-grade accuracy.

**SwiftAA is used in production apps**, including apps by [Vaonis](https://vaonis.com) (creators of smart telescopes like Stellina and Vespera) and [MeteorActive](https://itunes.apple.com/us/app/meteoractive/id1205712190?mt=8).

### Architecture & Direct C++ Interoperability

SwiftAA directly leverages **Swift 5.9+ C++ Interoperability (`.interoperabilityMode(.Cxx)`)** atop **AA+ v2.63**, the C++ implementation by P.J. Naughter of the reference textbook *Astronomical Algorithms* by Jean Meeus (2nd ed.). 

- **Zero-cost bridge**: No Objective-C or C wrapper layer (`AABridge` eliminated). Swift calls AA+ C++ methods directly with zero runtime overhead.
- **Swift 6 & Concurrency ready**: Built with strict concurrency checking support.
- **Strong Unit Safety**: Type-safe structures for `Degree`, `ArcSecond`, `Hour`, `JulianDay`, `AstronomicalUnit`, etc.
- **High Test Coverage**: Extensive test suite using both `XCTest` and modern `Swift-Testing` (`@Test`, `@Suite`).

Documentation
=======

SwiftAA includes full **Apple DocC** documentation. You can generate and preview documentation locally via:

```bash
swift package --disable-sandbox preview-documentation --target SwiftAA
```

Or generate the static documentation catalog:

```bash
swift package generate-documentation --target SwiftAA
```

Installation
============

Add SwiftAA as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/onekiloparsec/SwiftAA.git", from: "3.0.1")
]
```

Or add it directly in Xcode via **File > Add Package Dependencies...** and search for `SwiftAA`.

AA+ Core
---
The AA+ framework, written in C++ by PJ Naughter (Visual C++ MVP), is the comprehensive implementation of the algorithms in Jean Meeus' textbook. 

SwiftAA integrates AA+ v2.63 directly as a C++ SPM module target (`AAplus`).

Caution on Coordinates
-----

Coordinates computations are key for modern astronomy. Note that classical Meeus algorithms are referenced to standard dynamical epochs (such as standard equinox FK5 J2000.0) rather than relativistic ICRS. For conversions requiring high-order relativistic stellar motions, refer also to packages like [AstroPy](http://docs.astropy.org/en/stable/coordinates/index.html).


Prefixes & Conventions
----

Needless to say how different the syntax is between C, C++, Objective-C and Swift. The main guideline in writting SwiftAA was to build a C(++) layer that follow *strictly* the methods and interfaces of the underlying C++ library. Only the name of some variables were a bit "Objective-C-fied" (to avoid prefix them with the one-letter type, 'b' for boolean etc').

As C lacks namespaces, everything must be prefixed. It is a convention to use 3-letters prefixes in Objective-C. KPC stands for "kiloparsec" and is "my" usual prefix. I chose to keep the AA prefix that belongs to the C++ library as well. Hence the (rather long) 5-letters *KPCAA* prefix of all methods.

The constraint of having an C layer first comes from the fact that no C++ code can be written directly alongside Swift code (in the same file). And Swift doesn't have the header/implementation split into different files. Hence one must write a Objective-C++/C wrapper around it, with name prefixes. Additionally, this codebase is compatible with Swift on Linux, and Objective-C is largely unavailable there - and thus the `AABridge` layer is built in C.


Branches
----

For Swift4, see the  `swift4` branch. Likewise for Swift3 (unmaintained).


Author
======
Cédric Foellmi, a.k.a. **[@onekiloparsec](https://twitter.com/onekiloparsec)** ([website](https://onekiloparsec.dev)). <br/>
(Ph.D. in astrophysics, and former *support astronomer* at the [European Southern Observatory](http://www.eso.org) in Chile). <br/> I am the author of the app iObserve (for [macOS](http://onekiloparsec.dev/iobserve) (and formerly in [iOS/iPad]) and [arcsecond.io](https://www.arcsecond.io).

Support
=======

You can help me spend more time on Open-Source software for astronomers by <a href="https://patreon.com/onekiloparsec" target=_blank>supporting me on Patreon</a>! 

Licence
=======

The licence of this software is the [MIT](http://opensource.org/licenses/MIT) licence, which allows you to use it freely in open-source or commercial products. But it does not apply to the AA+ Framework, which retains its own licence. Quoting the [original](http://www.naughter.com/aa.html):

**AA+ Copyright :** 

* You are allowed to include the source code in any product (commercial, shareware, freeware or otherwise) when your product is released in binary form.
* You are allowed to modify the source code in any way you want except you cannot modify the copyright details at the top of each module.
* If you want to distribute source code with your application, then you are only allowed to distribute versions released by the author. This is to maintain a single distribution point for the source code.

## FOSSA

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fonekiloparsec%2FSwiftAA.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fonekiloparsec%2FSwiftAA?ref=badge_large)
