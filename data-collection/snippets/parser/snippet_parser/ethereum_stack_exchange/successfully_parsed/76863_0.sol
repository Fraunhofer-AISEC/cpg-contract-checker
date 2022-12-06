pragma solidity 0.5.10;

contract ContractD {
    address public contract_e_address;

    constructor(address _contract_e_address) public {
        contract_e_address = _contract_e_address;
    }

    function invokeContractE(uint256 _number_1, uint256 _number_2) public { 
        ContractE e = ContractE(contract_e_address);
        e.setN(_number_1, _number_2);
    } 
}

contract ContractE {
    uint256 public number_1;
    uint256 public number_2;

    function setN(uint256 _number_1, uint256 _number_2) public {
        number_1 = _number_1;
        number_2 = _number_2;
    }
}
