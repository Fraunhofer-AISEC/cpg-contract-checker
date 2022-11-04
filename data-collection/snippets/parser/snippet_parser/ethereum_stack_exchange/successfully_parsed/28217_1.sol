pragma solidity ^0.4.15;

contract X {

    struct Voter {
        bytes32 data;
        uint amount;
    }
    mapping(address => Voter) voter;
    address[] voterIndex;
    uint voter_count;

    event Deposit(address a, uint b);

    function sendEther(bytes32 data) public payable  {
      address sender = msg.sender;
      uint value = msg.value;
      voter[sender].data = data;
      voter[sender].amount = value;
      voterIndex[voter_count] = sender;
      voter_count = voter_count + 1;
      Deposit(sender, value);
    }

}
