pragma solidity ^0.8.0;

import "IGenerator.sol";

contract Management {
address payable immutable public manager;

string public matchDispute;

constructor(address _contract) {
    manager = payable(IGenerator(_contract).owner());
    matchDispute = IGenerator(_contract).matchGenerated();
}
}