
pragma solidity ^0.8.0;

import "./Token1.sol";   

contract FFA {

    TestC _token = TestC(0x93e8C4b313966461239605A771bc10cfb79748F3);   

    

    function transfer(address _to,uint256 _amount)public {  
        require(_token.transferFrom(msg.sender,_to,_amount)); 
    }

}
