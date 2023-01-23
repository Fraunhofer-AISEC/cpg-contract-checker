contract FinalizableCrowdsale is TimedCrowdsale {
using SafeMath for uint256;

bool private _finalized;

event CrowdsaleFinalized();

constructor() internal {
_finalized = false;
}


function finalized() public view returns (bool) {
return _finalized;
}


function finalize() public {
require(!_finalized);
require(hasClosed());

_finalized = true;

_finalization();
emit CrowdsaleFinalized();
}


function _finalization() internal {
}
}
