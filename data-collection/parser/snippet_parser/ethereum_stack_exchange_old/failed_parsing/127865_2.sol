bytes memory _b = abi.encode("SpotPrice",abi.encode("MATIC","USD"));
bytes32 _queryID = keccak256(_b);

bool _didGet;
uint256 _timestamp;
bytes _value

(_, _value, _timestamp) = getDataBefore(_queryId);

uint256 maticPrice = abi.decode(_value,(uint256));

require(token.transferFrom(subscriber,address(this),cost/maticPrice));
