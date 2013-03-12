//
//  Car.h
//  JaxArcSigHome
//
//  Created by David Fekke on 10/2/12.
//
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, strong) NSNumber *Speed;
@property (nonatomic, strong) NSNumber *EngineTemp;

-(id)initWithSpeed:(NSNumber *)newSpeed;
-(id)initWithSpeed:(NSNumber *)newSpeed EngineTemp:(NSNumber *)newEngineTemp;
-(void)SpeedUpBy20;
-(void)SlowDownBy20;

@end
