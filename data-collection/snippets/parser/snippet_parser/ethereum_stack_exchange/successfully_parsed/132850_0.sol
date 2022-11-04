 function buy() external{

    uint balance = getbalance();
    uint allowance = getAllowance();
   
    require(balance>=price && allowance>=price, "Incorrect balance or allowance");
    _mint(msg.sender, ++Counters);
    getFunds();
}

function getFunds() internal returns(bool result){
    bytes memory data = abi.encodeWithSelector(token.transferFrom.selector, msg.sender, address(this), 50000);
    address tokenAdd = address(token);
    assembly{
    let status:= call(260000, tokenAdd, 0, add(data, 32), mload(data), 0, 0)
    if eq(status, 1) {
        if eq(returndatasize(), 32) {
            returndatacopy(0, 0, 32)
            result := mload(0)
            }
        }
    }
}


function getbalance() internal view returns(uint result){
    bytes memory data = abi.encodeWithSelector(token.balanceOf.selector, msg.sender);
    result = 0;
    address tokenAdd = address(token);
    assembly{
       let status:= staticcall(16000, tokenAdd, add(data, 32), mload(data), 0, 0)
       if eq(status, 1) {
        if eq(returndatasize(), 32) {
            returndatacopy(0, 0, 32)
            result := mload(0)
            }
        }
    }
}
function getAllowance() internal view returns(uint result){
    bytes memory data = abi.encodeWithSelector(token.allowance.selector, msg.sender, address(this));
    result = 0;
    address tokenAdd = address(token);
    assembly{
       let status:= staticcall(16000, tokenAdd, add(data, 32), mload(data), 0, 0)
       if eq(status, 1) {
        if eq(returndatasize(), 32) {
            returndatacopy(0, 0, 32)
            result := mload(0)
            }
        }
    }
}
