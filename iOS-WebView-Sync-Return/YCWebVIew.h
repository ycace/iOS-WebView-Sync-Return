//
//  YCWebVIew.h
//  webkitSyncReturn
//
//  Created by 严诚 on 2018/12/5.
//  Copyright © 2018 严诚. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YCPromptDelegate <NSObject>
-(NSString *) webView:(UIWebView *)sender runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)text initiatedByFrame:(CGRect )frame;

@end


@interface YCWebVIew : UIWebView
@property(weak, nonatomic)id <YCPromptDelegate>promptDelegate;

@end

