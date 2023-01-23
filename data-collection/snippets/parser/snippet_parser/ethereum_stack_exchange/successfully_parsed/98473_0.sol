address public addr;

function addValue() external payable {
   _addValue(msg.value);
}

function _addValue(uint256 value) internal payable {
   addr.send(value);
}
