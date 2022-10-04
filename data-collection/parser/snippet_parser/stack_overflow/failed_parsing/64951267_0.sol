Unhandled Rejection (Error): call revert exception (method="symbol()", errorSignature=null, errorArgs=[null], reason=null, code=CALL_EXCEPTION, version=abi/5.0.8)
Logger.makeError
/Users/username/Desktop/final-4/src.ts/index.ts:205
Logger.throwError
/Users/username/Desktop/final-4/src.ts/index.ts:217
Interface.decodeFunctionResult
/Users/username/Desktop/final-4/src.ts/interface.ts:326
  323 |     eventFragment = this.getEvent(eventFragment);
  324 | }
  325 | const topics = [];
> 326 | const dataTypes = [];
      | ^  327 | const dataValues = [];
  328 | if (!eventFragment.anonymous) {
  329 |     topics.push(this.getEventTopic(eventFragment));

View compiled
Contract.<anonymous>
/Users/username/Desktop/final-4/src.ts/index.ts:309
fulfilled
http:
