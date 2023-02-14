
pragma solidity >=0.8.6;

import "./AuthContract.sol";

contract Contract {
    string public message;

    constructor() {
      message = "test";
    }

    function getMessage() public view returns(string memory) {
      return message;
    }
}
