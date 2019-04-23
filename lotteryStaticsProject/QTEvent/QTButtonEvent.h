//
//  QTButtonEvent.h
//  lotteryStaticsProject
//
//  Created by test on 2019/3/12.
//  Copyright © 2019 HLM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QTEventBus.h"

NS_ASSUME_NONNULL_BEGIN

@interface QTButtonEvent : NSObject <QTEvent>

@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
