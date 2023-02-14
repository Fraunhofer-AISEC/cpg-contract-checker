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


contract Ownable {
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

}

contract Deployed is Ownable {
    uint public a = 1;

    function setA(uint _a) public onlyOwner returns (uint) {
        a = _a;
        return a;
    }

}
