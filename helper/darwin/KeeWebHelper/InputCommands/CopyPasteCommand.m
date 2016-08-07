#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

#import "CopyPasteCommand.h"
#import "../KeyRunner.h"

@implementation CopyPasteCommand

- (id)initWithText:(NSString *)aText {
    self = [super init];
    if (self) {
        text = aText;
    }
    return self;
}

- (void)execute {
    usleep(500000);
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    [pasteboard clearContents];
    [pasteboard setString:text forType:NSStringPboardType];
    usleep(500000);
    [KeyRunner keyUpDown:0 code:kVK_Command flags:0 down:true];
    [KeyRunner keyPress:0 code:kVK_ANSI_V flags:kCGEventFlagMaskCommand];
    [KeyRunner keyUpDown:0 code:kVK_Command flags:0 down:false];
    usleep(500000);
}

@end
