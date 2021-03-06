//
//  YCCHMapClusterer.h
//  YCCHMapClusterController
//
//  Copyright (C) 2013 Claus Höfele
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "YandexMapKit.h"

@class YCCHMapClusterController;

/** 
 A custom strategy that defines where clusters are positioned must implement this protocol.
 */
@protocol YCCHMapClusterer

/**
 Called on a background thread to determine the location of the cluster for the given annotations.
 @param mapClusterController map cluster controller.
 @param annotations annotations in this cluster (annotations are of type `YCCHMapClusterAnnotation`).
 @param mapRect the area that's covered by this cluster.
 */
- (CLLocationCoordinate2D)mapClusterController:(YCCHMapClusterController *)mapClusterController coordinateForAnnotations:(NSSet *)annotations inMapRect:(MKMapRect)mapRect;

/**
 Returns region holding all annotations.
 @param annotations annotations in this cluster (annotations are of type `YCCHMapClusterAnnotation`).
 @return MKCoordinateRegion
 */
-(MKCoordinateRegion)regionForAnnotations:(NSSet *)annotations;

@end
