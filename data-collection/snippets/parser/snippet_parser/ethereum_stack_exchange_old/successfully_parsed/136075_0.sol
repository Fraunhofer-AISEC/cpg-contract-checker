pragma solidity 0.8.13;

contract callerContract{
    address payable targetAddress = payable(0x3328358128832A260C76A4141e19E2A943CD4B6D);
     bytes public result;

     constructor() payable{}
    
    function callExternal(uint256 _number) public{
        (bool success, bytes memory returnData) = targetAddress.call{value: 100, gas: 10000}(abi.encodeWithSignature("targetFunction(uint256)",_number));
        result = returnData;
    }
}
