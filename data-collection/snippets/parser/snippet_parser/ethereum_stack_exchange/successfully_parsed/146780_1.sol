

pragma solidity ^0.8.7;

interface IContractB {
    function GetExecutionInfo(address _address) external view returns (address, bytes memory, uint256);
}

contract ContractA {

    IContractB contractB;

    constructor (address _contractAddress) {
        contractB = IContractB(_contractAddress);
    }


    function getInformationFromContractB (address _address) public view returns (address, bytes memory, uint256){
        return (contractB.GetExecutionInfo(_address));
    }
}
