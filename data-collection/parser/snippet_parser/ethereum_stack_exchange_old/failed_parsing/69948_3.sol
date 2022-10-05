Option 1: contract.getAssetPrice(0).call((error, result) => {                            

TypeError: contract.getCallPrice(...).call is not a function

Option 2: contract.getAssetPrice.call(0, (error, result) => {

Faced same result i.e. inconsistent output.
