//
//  YCWebVIew.m
//  webkitSyncReturn
//
//  Created by 严诚 on 2018/12/5.
//  Copyright © 2018 严诚. All rights reserved.
//

#import "YCWebVIew.h"

@implementation YCWebVIew

-(NSString *) webView:(UIWebView *)sender runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)text initiatedByFrame:(CGRect )frame {
    if ([self.promptDelegate respondsToSelector:@selector(webView:runJavaScriptTextInputPanelWithPrompt:defaultText:initiatedByFrame:)]) {
        return [self.promptDelegate webView:sender runJavaScriptTextInputPanelWithPrompt:prompt defaultText:text initiatedByFrame:frame];
    }
    return prompt;
}

@end
