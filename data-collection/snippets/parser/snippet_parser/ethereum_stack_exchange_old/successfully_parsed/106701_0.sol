pragma solidity >=0.8.0 <0.9.0;


contract Parent {
    string public name = "Contract Parent";
}

contract Child is Parent {
    constructor() {
        name = "Contract Child";
    }

    function getName() public view returns (string memory) {
        return name;
    }
    string public childGetName = getName();
}
