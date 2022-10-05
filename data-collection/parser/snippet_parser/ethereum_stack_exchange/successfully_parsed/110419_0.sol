pragma solidity ^0.6.6;

contract MyContract {
    function someFun() public {
        (bool success,  ) = address(this).call{value: 1 ether}(abi.encodeWithSignature("someOtherFunction(uint256)", 123));
        require(success, "Contract execution Failed");
    }
    
    function someOtherFunction(uint _myVar) public {
        
    }
}
