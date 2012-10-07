//
//  EffectsProcessor.m
//  Objective-C Sound Example
//
//  Created by Aurelius Prochazka on 6/9/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "EffectsProcessor.h"
#import "OCSReverb.h"
#import "OCSAudio.h"

@implementation EffectsProcessor

- (id)initWithToneGenerator:(ToneGenerator *)toneGenerator
{
    self = [super init];
    if (self) {                  
        
        // INPUTS ==============================================================
        
        OCSParameter * input = [toneGenerator auxilliaryOutput];
        
        // INSTRUMENT DEFINITION ===============================================
        
        OCSReverb * reverb = [[OCSReverb alloc] initWithMonoInput:input
                                                    feedbackLevel:ocsp(0.9)
                                                  cutoffFrequency:ocsp(12000)];
        [self connect:reverb];
        
        // AUDIO OUTPUT ========================================================
            
        OCSAudio *audio = [[OCSAudio alloc] initWithLeftInput:[reverb leftOutput] 
                                                   rightInput:[reverb rightOutput]]; 
        [self connect:audio];
        
        // RESET INPUTS ========================================================
        [self resetParam:input];
    }
    return self;
}

@end