pragma solidity ^0.4.22;

contract Factory {
    function getName() internal pure returns (string) {
        return "Your Name";
    }
}

contract Contract is Factory {
    string public Name;

    constructor () public {
        Name = getName();
    }
}
