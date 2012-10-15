/*
 *  MaplyShape.m
 *  WhirlyGlobe-MaplyComponent
 *
 *  Created by Steve Gifford on 9/28/12.
 *  Copyright 2012 mousebird consulting
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

#import "MaplyShape.h"
#import "WhirlyGlobe.h"

using namespace WhirlyKit;

@implementation MaplyShapeCircle

@synthesize center;
@synthesize radius;

@end

@implementation MaplyShapeSphere

@synthesize center;
@synthesize radius;

@end

@implementation MaplyShapeCylinder

@synthesize baseCenter;
@synthesize radius;
@synthesize height;

@end

@implementation MaplyShapeGreatCircle

@synthesize startPt,endPt;
@synthesize height;
@synthesize lineWidth;

- (id)init
{
    self = [super init];
    if (!self)
        return nil;
    
    lineWidth = 1.0;
    
    return self;
}

- (float)calcAngleBetween
{
    Point3f p0 = FakeGeocentricDisplayAdapter::LocalToDisplay(Point3f(startPt.x,startPt.y,0.0));
    Point3f p1 = FakeGeocentricDisplayAdapter::LocalToDisplay(Point3f(endPt.x,endPt.y,0.0));
    
    float dot = p0.dot(p1);
    Point3f cross = p0.cross(p1);
//    float mag = cross.norm();

    // Note: Atan2 is the correct way, but it's not working right here
//    return atan2f(dot, mag);
    return acosf(dot);
}

@end