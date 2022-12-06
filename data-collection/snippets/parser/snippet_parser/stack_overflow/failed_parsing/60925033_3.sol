~/Documents/Inbox$ npm run test

> inbox@1.0.0 test /home/sahil/Documents/Inbox
> mocha



  Inbox
(node:19409) MaxListenersExceededWarning: Possible EventEmitter memory leak detected. 11 data listeners added to [l]. Use emitter.setMaxListeners() to increase limit
    ✓ deploys a contract
    ✓ set initial value
    1) can set new value


  2 passing (511ms)
  1 failing

  1) Inbox
       can set new value:

      AssertionError [ERR_ASSERTION]: 'Hi there!' == 'bye'
      + expected - actual

      -Hi there!
      +bye

      at Context.<anonymous> (test/Inbox.test.js:38:12)
      at processTicksAndRejections (internal/process/task_queues.js:97:5)



npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! inbox@1.0.0 test: `mocha`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the inbox@1.0.0 test script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/sahil/.npm/_logs/2020-03-30T05_58_56_753Z-debug.log
