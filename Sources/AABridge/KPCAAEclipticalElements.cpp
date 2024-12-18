//
//  KPCAAEclipticalElements.m
//  SwiftAA
//
//  Created by Cédric Foellmi on 05/07/15.
//  Licensed under the MIT License (see LICENSE file)
//

#import "KPCAAEclipticalElements.h"
#import "AAEclipticalElements.h"
#import "KPCAAMercury.h"
#import "KPCAAVenus.h"
#import "KPCAAEarth.h"
#import "KPCAAMars.h"
#import "KPCAAJupiter.h"
#import "KPCAASaturn.h"
#import "KPCAAUranus.h"
#import "KPCAANeptune.h"
#import "KPCAAPluto.h"
#include <stdexcept>

KPCAAEclipticalElementDetails KPCAAEclipticalElement_CalculateDetails(double i0, double w0, double omega0, double JD0, double JD)
{
    CAAEclipticalElementDetails detailsPlus = CAAEclipticalElements::Calculate(i0, w0, omega0, JD0, JD);
    
    struct KPCAAEclipticalElementDetails details;
    details.i = detailsPlus.i;
    details.w = detailsPlus.w;
    details.omega = detailsPlus.omega;
    
    return details;
}

KPCAAEclipticalElementDetails KPCAAEclipticalElement_FK4B1950ToFK5J2000(double i0, double w0, double omega0)
{
    CAAEclipticalElementDetails detailsPlus = CAAEclipticalElements::FK4B1950ToFK5J2000(i0, w0, omega0);

    struct KPCAAEclipticalElementDetails details;
    details.i = detailsPlus.i;
    details.w = detailsPlus.w;
    details.omega = detailsPlus.omega;
    
    return details;
}

double KPCAAEclipticalElement_EclipticLongitude(double JD, KPCAAPlanet planet, bool highPrecision)
{
    switch (planet) {
        case KPCAAPlanetMercury: {
            return KPCAAMercury_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetVenus: {
            return KPCAAVenus_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetEarth: {
            return KPCAAEarth_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetMars: {
            return KPCAAMars_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetJupiter: {
            return KPCAAJupiter_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetSaturn: {
            return KPCAASaturn_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetUranus: {
            return KPCAAUranus_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetNeptune: {
            return KPCAANeptune_EclipticLongitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetPluto: {
            return KPCAAPluto_EclipticLongitude(JD);
            break;
        }
        default: {
            throw std::invalid_argument("Invalid planet type");
            return -1.0;
            break;
        }
    }
}

double KPCAAEclipticalElement_EclipticLatitude(double JD, KPCAAPlanet planet, bool highPrecision)
{
    switch (planet) {
        case KPCAAPlanetMercury: {
            return KPCAAMercury_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetVenus: {
            return KPCAAVenus_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetEarth: {
            return KPCAAEarth_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetMars: {
            return KPCAAMars_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetJupiter: {
            return KPCAAJupiter_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetSaturn: {
            return KPCAASaturn_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetUranus: {
            return KPCAAUranus_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetNeptune: {
            return KPCAANeptune_EclipticLatitude(JD, highPrecision);
            break;
        }
        case KPCAAPlanetPluto: {
            return KPCAAPluto_EclipticLatitude(JD);
            break;
        }
        default: {
            throw std::invalid_argument("Invalid planet type");
            return -1.0;
            break;
        }
    }
}

double KPCAAEclipticalElement_RadiusVector(double JD, KPCAAPlanet planet, bool highPrecision)
{
    switch (planet) {
        case KPCAAPlanetMercury: {
            return KPCAAMercury_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetVenus: {
            return KPCAAVenus_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetEarth: {
            return KPCAAEarth_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetMars: {
            return KPCAAMars_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetJupiter: {
            return KPCAAJupiter_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetSaturn: {
            return KPCAASaturn_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetUranus: {
            return KPCAAUranus_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetNeptune: {
            return KPCAANeptune_RadiusVector(JD, highPrecision);
            break;
        }
        case KPCAAPlanetPluto: {
            return KPCAAPluto_RadiusVector(JD);
            break;
        }
        default: {
            throw std::invalid_argument("Invalid planet type");
            return -1.0;
            break;
        }
    }
}
