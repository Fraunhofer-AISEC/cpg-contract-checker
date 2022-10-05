pragma solidity ^0.4.8;

interface tokenRecipient {
   function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public;
}

contract TokenERC20 {
    
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    
    uint256 public totalSupply;
}