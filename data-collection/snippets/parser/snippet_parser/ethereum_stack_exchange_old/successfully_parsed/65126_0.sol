pragma solidity ^0.4.25;

contract Purchase {
    address public sellerAddress;

    constructor (address _sellerAddress) {
        sellerAddress = _sellerAddress;
    }
}

contract Buyer is Purchase {
    address public buyerAddress;
    string pass;
    bytes32 hashpass;

    modifier onlyBuyer() {
        require(msg.sender == buyerAddress);
        _;
    }

    constructor(string _pass) {
        buyerAddress = msg.sender;
        pass = _pass;
    }

    function stringToBytes32(string pass) returns (bytes32 hashpass) {
        hashpass = bytes32(pass);
    }

    function generateHashPass() public {

    }
}
