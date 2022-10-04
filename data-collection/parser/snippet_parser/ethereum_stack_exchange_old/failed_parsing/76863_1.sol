pragma solidity 0.5.10;

contract ContractD {
    ContractE e = ContractE(<CONTRACT_E_ADDRESS>);

    function invokeContractE(uint256 _number_1, uint256 _number_2) public { 
        e.setN(_number_1, _number_2);
    } 
}

interface ContractE {
    function setN(uint256 _number_1, uint256 _number_2) external;
}
