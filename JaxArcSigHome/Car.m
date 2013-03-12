//
//  Car.m
//  JaxArcSigHome
//
//  Created by David Fekke on 10/2/12.
//
//

#import "Car.h"

@implementation Car

-(id)initWithSpeed:(NSNumber *)newSpeed
{
    self = [super init];
    self.Speed = newSpeed;
    self.EngineTemp = [[NSNumber alloc] initWithInt:0];
    return self;
}

-(id)initWithSpeed:(NSNumber *)newSpeed EngineTemp:(NSNumber *)newEngineTemp
{
    self = [self initWithSpeed:newSpeed];
    self.EngineTemp = newEngineTemp;
    return self;
}


-(void)SpeedUpBy20
{
    int tempValue = [self.Speed intValue];
    tempValue += 20;
    self.Speed = [[NSNumber alloc] initWithInt:tempValue];
}

-(void)SlowDownBy20
{
    int tempValue = [self.Speed intValue];
    tempValue -= 20;
    self.Speed = [[NSNumber alloc] initWithInt:tempValue];
}


@end
