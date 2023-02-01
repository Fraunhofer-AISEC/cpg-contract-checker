  Lottery Unit Tests
    fulfillRandomWords      1) "before each" hook for "can only be called after performUpKeep"


  0 passing (869ms)
  1 failing

  1) Lottery Unit Tests       "before each" hook for "can only be called after performUpKeep":
     TypeError: Cannot read properties of null (reading 'call')       at Contract.<anonymous> (node_modules\@ethersproject\contracts\src.ts\index.ts:397:47)      at step (node_modules\@ethersproject\contracts\lib\index.js:48:23)      at Object.next (node_modules\@ethersproject\contracts\lib\index.js:29:53)      at fulfilled (node_modules\@ethersproject\contracts\lib\index.js:20:58)      at processTicksAndRejections (node:internal/process/task_queues:96:5)
      at runNextTicks (node:internal/process/task_queues:65:3)  
      at listOnTimeout (node:internal/timers:528:9)
      at processTimers (node:internal/timers:502:7)
