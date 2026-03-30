#import <UIKit/UIKit.h>

@interface MMTabBarView : UIView
@end

static UIVisualEffectView *glassView;

%hook MMTabBarView

- (void)layoutSubviews {
    %orig;

    if (!glassView) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
        glassView = [[UIVisualEffectView alloc] initWithEffect:blur];

        glassView.layer.cornerRadius = 22;
        glassView.layer.shadowOpacity = 0.15;

        [self insertSubview:glassView atIndex:0];
    }

    glassView.frame = CGRectInset(self.bounds, 10, 5);
}

%end
