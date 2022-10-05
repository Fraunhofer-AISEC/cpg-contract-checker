
pragma solidity ^0.8.0;

interface CalleeContractInt{
    function add(uint a, uint b) external returns(uint);
    function exp(uint a, uint b) external returns(uint);
}

contract ContractB{
    address public calleeAddress;
    string signatureAdd = "add(uint256,uint256)";
    CalleeContractInt CalleeContract;

    constructor(address _calleeAddress){
        calleeAddress = _calleeAddress;
        CalleeContract = CalleeContractInt(_calleeAddress);
    }

    function callAddWithSignature(uint a, uint b) public returns(bool success) {
        bytes memory data;
        (success, data) = calleeAddress.call(abi.encodeWithSignature(signatureAdd,a,b));
    }

    function callAddviaInterface(uint a, uint b) public returns(uint){
        uint c = CalleeContract.add(a,b);
        return c;
    }
}
