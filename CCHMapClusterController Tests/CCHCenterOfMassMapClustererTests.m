//
//  YCCHCenterOfMassMapClustererTests.m
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

#import "YCCHCenterOfMassMapClusterer.h"

#import <XCTest/XCTest.h>

@interface YCCHCenterOfMassMapClustererTests : XCTestCase

@property (nonatomic) YCCHCenterOfMassMapClusterer *mapClusterer;

@end

@implementation YCCHCenterOfMassMapClustererTests

- (void)setUp
{
    [super setUp];
    
    self.mapClusterer = [[YCCHCenterOfMassMapClusterer alloc] init];
}

- (void)testCoordinateForAnnotationsNil
{
    CLLocationCoordinate2D coordinate = [self.mapClusterer mapClusterController:nil coordinateForAnnotations:nil inMapRect:MKMapRectNull];
    XCTAssertEqual(coordinate.latitude, 0.0);
    XCTAssertEqual(coordinate.longitude, 0.0);
}

- (void)testCoordinateForAnnotationsEmpty
{
    NSMutableSet *annotations = [[NSMutableSet alloc] init];
    CLLocationCoordinate2D coordinate = [self.mapClusterer mapClusterController:nil coordinateForAnnotations:annotations inMapRect:MKMapRectNull];
    XCTAssertEqual(coordinate.latitude, 0.0);
    XCTAssertEqual(coordinate.longitude, 0.0);
}

- (void)testCoordinateForAnnotations
{
    NSMutableSet *annotations = [[NSMutableSet alloc] initWithCapacity:4];
    MKPointAnnotation *annotation0 = [[MKPointAnnotation alloc] init];
    annotation0.coordinate = CLLocationCoordinate2DMake(10, 0);
    [annotations addObject:annotation0];
    MKPointAnnotation *annotation1 = [[MKPointAnnotation alloc] init];
    annotation1.coordinate = CLLocationCoordinate2DMake(10, 10);
    [annotations addObject:annotation1];
    MKPointAnnotation *annotation2 = [[MKPointAnnotation alloc] init];
    annotation2.coordinate = CLLocationCoordinate2DMake(10, 20);
    [annotations addObject:annotation2];
    MKPointAnnotation *annotation3 = [[MKPointAnnotation alloc] init];
    annotation3.coordinate = CLLocationCoordinate2DMake(10, 30);
    [annotations addObject:annotation3];
    
    CLLocationCoordinate2D averageCoordinate = CLLocationCoordinate2DMake(40 / 4, 60 / 4);
    CLLocationCoordinate2D coordinate = [self.mapClusterer mapClusterController:nil coordinateForAnnotations:annotations inMapRect:MKMapRectNull];
    XCTAssertEqualWithAccuracy(averageCoordinate.latitude, coordinate.latitude, __FLT_EPSILON__);
    XCTAssertEqualWithAccuracy(averageCoordinate.longitude, coordinate.longitude, __FLT_EPSILON__);
}

@end
