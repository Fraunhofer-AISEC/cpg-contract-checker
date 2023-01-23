pragma solidity ^0.4.23;

contract Hotelbooking {

  event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

 mapping(address => uint256) public balanceOf;


  


  function transfer(address _to, uint256 _value) public returns (bool success) {
          require(balanceOf[msg.sender] >= _value);

          balanceOf[msg.sender] -= _value;

          balanceOf[_to] += _value;

          Transfer(msg.sender, _to, _value);
            return true;

      }
    }
