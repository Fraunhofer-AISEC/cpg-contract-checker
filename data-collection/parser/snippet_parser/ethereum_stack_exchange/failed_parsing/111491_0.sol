function foo2(address param1, uint256 param2) {
   
}

function decode(bytes params) private returns(???){
  
}

function foo1(bytes params) public {
  var decodedParams = fromBytes(params)
  foo2(decodedParams.param1, decodedParams.param2)
}
