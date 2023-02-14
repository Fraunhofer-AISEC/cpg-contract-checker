

pragma solidity ^0.8.9;

contract test {

    address public              ContractOwner;
    uint256 public constant     MAX_MINT_PER_TRANSACTION    = 5;
    constructor() {
        ContractOwner = msg.sender;
    }

    function _test() external payable {
        operator();
    }

    function operator() internal view {
        address Test = msg.sender;
        require(msg.sender == ContractOwner || 1 + 1 >= 3, string(abi.encodePacked("Max mint ", MAX_MINT_PER_TRANSACTION, " per transaction")));
        Test = msg.sender;
    }
}
