pragma solidity ^0.4.16;

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; }

contract TokenERC20 {
   
   string public testToken = "Test Token";
   string public test = "TEST";
   uint8 public decimals = 18;
   
uint256 public bigNumber = 100000000;
}