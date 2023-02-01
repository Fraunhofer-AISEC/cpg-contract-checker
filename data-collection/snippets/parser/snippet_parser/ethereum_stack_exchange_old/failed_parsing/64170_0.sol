pragma solidity >=0.4.0 <0.6.0;

contract property {

    uint public value;
    string public location;
    
    constructor(uint  _value, string _location) public {
          value = _value;
          location = _location;          
    }

    function setval(uint _value) public{
        value = _value;

    }

function getloc1() public pure returns(memory string) {,<--- getting error here
    return location;
  }
}
