node init.js
/home/root/init.js:16
    abiDefinition = JSON.parse(contract.contracts[':kyc'].interface);
                                                 ^

TypeError: Cannot read property ':kyc' of undefined
    at Timeout.afterDelay [as _onTimeout] (/home/root/init.js:16:50)
    at listOnTimeout (internal/timers.js:554:17)
    at processTimers (internal/timers.js:497:7)
