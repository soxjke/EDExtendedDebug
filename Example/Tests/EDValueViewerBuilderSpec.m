//
//  EDExtendedDebugTests.m
//  EDExtendedDebugTests
//
//  Created by Alexey Fayzullov on 5/14/15.
//  Copyright (c) 2015 Alexey Fayzullov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>

#import <EDExtendedDebug/EDValueViewerBuilder.h>
#import <EDExtendedDebug/EDPropertyValueViewer.h>

SpecBegin(EDValueViewerBuilder)

describe(@"build", ^{
    
    it(@"should return filled viewer and call setupFormatters", ^{

        EDValueViewerBuilder *sut = [EDValueViewerBuilder new];
        
        id sutMock = OCMPartialMock(sut);
        [[sutMock expect] setupFormatter];
        
        EDPropertyValueViewer *viewer = [sut build];
        
        EXP_expect(viewer).notTo.beNil;
        [sutMock verify];
    });
});

describe(@"setupFormatter", ^{
    it(@"should set correct formatters to viewer", ^{
        
        EDValueViewerBuilder *sut = [EDValueViewerBuilder new];
        id sutMock = OCMPartialMock(sut);
        id viewerMock = OCMClassMock([EDPropertyValueViewer class]);
        [[[sutMock stub] andReturn:viewerMock] viewer];
        
        [[viewerMock expect] setObjectFormatter:[OCMArg isKindOfClass:[EDDescriptionFormatter class]]];
        [[viewerMock expect] setAtomicTypesFormatter:[OCMArg isKindOfClass:[EDAtomicTypesFormatter class]]];
        [[viewerMock expect] setStructFormatter:[OCMArg isKindOfClass:[EDStructFormatter class]]];
        [[viewerMock expect] setClassFormatter:[OCMArg isKindOfClass:[EDDescriptionFormatter class]]];
        
        [sut setupFormatter];
        
        [viewerMock verify];
        [sutMock stopMocking];
    });
});

SpecEnd
