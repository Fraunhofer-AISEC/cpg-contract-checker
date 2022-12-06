pragma solidity >=0.6.0; 
contract test {
    event ReturnValue(address payable _from, bytes data);
    function f() public returns(bytes memory){
        address payable addr1 = payable(msg.sender);
        bytes memory params = new bytes(2);
        params[0] = 0x21;
        params[1] = 0x22;
        bytes memory result = myopcode(addr1, 0x11, 0x12, params);
        emit ReturnValue(addr1, result);
        return result;
    }
}
