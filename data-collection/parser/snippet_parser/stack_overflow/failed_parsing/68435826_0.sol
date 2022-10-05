    ✓ Should deploy smart contract properly
    1) "before each" hook: before test for "should call a function that depends on a linked library"
    2) "before each" hook: before test for "should call a function that depends on a linked library"


  1 passing (172ms)
  2 failing

  1) Contract: My
       "before each" hook: before test for "should call a function that depends on a linked library":
     Uncaught TypeError: Cannot read property 'call' of undefined
      at /Users/.../test/myToken.js:8:47
      at processTicksAndRejections (node:internal/process/task_queues:96:5)

  2) Contract: My
       "before each" hook: before test for "should call a function that depends on a linked library":
     Error: done() called multiple times in hook <Contract: MyToken "before each" hook: before test for "should call a function that depends on a linked library"> of file ...


UnhandledRejections detected
Promise {
  <rejected> TypeError: Cannot read property 'call' of undefined
      at /Users/.../myToken.js:8:47
      at processTicksAndRejections (node:internal/process/task_queues:96:5) {
    uncaught: true,
    multiple: [ [Error] ]
  }
} TypeError: Cannot read property 'call' of undefined
    at /Users/.../myToken.js:8:47
    at processTicksAndRejections (node:internal/process/task_queues:96:5) {
  uncaught: true,
  multiple: [
    Error: done() called multiple times in hook <Contract: MyToken "before each" hook: before test for "should call a function that depends on a linked library"> of file /Users/.../myToken.js
        at processTicksAndRejections (node:internal/process/task_queues:96:5) {
      code: 'ERR_MOCHA_MULTIPLE_DONE',
      valueType: 'undefined',
      value: undefined
    }
  ]
}
