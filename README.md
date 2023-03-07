# Example for retry service provides policy for how often some operation should happen with the timeout limit and delay between events

The service creates sequence of the delays (nanoseconds) according to chosen strategy 

There are two strategies
- constant - constant delay between retries
- exponential - Exponential backoff is a strategy in which you increase the delays between retries

```swift
        /// Constant delay between retries
        case constant(
            retry : UInt = 5,
            duration: DispatchTimeInterval = .seconds(2),
            timeout: DispatchTimeInterval = .seconds(Int.max)
        )
        
        /// Exponential backoff is a strategy in which you increase the delays between retries
        case exponential(
            retry : UInt = 3,
            multiplier: Double = 2.0, // The power exponent
            duration: DispatchTimeInterval = .seconds(2),
            timeout: DispatchTimeInterval = .seconds(Int.max)
        )

```

## Packages using the package

[Async http client](https://github.com/The-Igor/async-http-client)
