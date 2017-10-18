# BYTimer

This is a the GCD timer Ruin a per second

## Usage

```
    [BYTimer timerWithTimeout:10 handlerBlock:^(int timeout) {
        NSLog(@"timeout %d", timeout);
    } finish:^() {
        NSLog(@"end");
    }];
```
or

```
    BYTimer *timer = [[BYTimer alloc] init];
    [timer createTimerWithTimeout:10 handlerBlock:^(int presentTime) {
        NSLog(@"timeout %d", presentTime);
    } finish:^{
        NSLog(@"end");
    }];
```
