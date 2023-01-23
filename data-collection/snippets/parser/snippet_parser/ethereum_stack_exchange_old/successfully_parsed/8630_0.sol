pragma solidity ^0.4.0;
contract Test {
    mapping (address => uint256) weismap;

    function bet(uint vote) payable returns (uint256 weis) {
        if (msg.value==0) 
            throw;
        weismap[msg.sender]= msg.value;
        return  weismap[msg.sender];
    }

    function test() constant returns (uint myVote)  {
        return 1;
    }
}
