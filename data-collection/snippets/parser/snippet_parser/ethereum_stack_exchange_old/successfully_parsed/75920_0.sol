pragma solidity >=0.4.22 <0.6.0;
contract Existing {
    Deployed public dc;
    constructor(address _deployedContractAddress) public {
        dc = Deployed(_deployedContractAddress);
    }

    function setA(uint _a) public returns (uint) {
        return dc.setA(_a);
    }
    function getA() public view returns (uint) {
        return dc.a();
    }
}

contract Deployed {
    uint public a = 1;

    function setA(uint _a) public returns (uint) {
        a = _a;
        return a;
    }

}
