

pragma solidity ^0.8.1;

contract MyContract {

    uint public myUnit = 10;

    address public  m;

    mapping(address => uint) private p;

    function setUnit()  public {
        p[msg.sender] = 24;
    }

    function rUnit(address a) public view returns(uint){
        return p[a];
    }


    function test() public view{
        require(m == address(0));
    }

    function getMapLocation(uint slot, address key) public pure returns(bytes32){
        return bytes32(keccak256(abi.encodePacked(key, slot)));
    }
}
```
