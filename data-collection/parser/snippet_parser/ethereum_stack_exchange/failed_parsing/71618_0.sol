pragma solidity ^0.5.1;
    contract Signed1 {
        uint val= 0;
        function withdrawOnce(int amount) public returns (uint){
           revert();
        }
        msg.sender.transfer(uint(amount));
        transferred[msg.sender] = true;

    }
