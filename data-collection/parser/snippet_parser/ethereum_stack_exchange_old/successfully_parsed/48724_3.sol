pragma solidity ^0.4.23;

contract ParentContract{

    ConfigContract two;

    constructor(ConfigContract _conf) public{
        two = _conf;
    }

    function getNameFromOtherContract() public view returns(string) {
        return two.getName();
    }
}

contract ConfigContract{

    constructor() public{
    }

    function getName() external pure returns (string) {
        return "Amel";
    }
}
