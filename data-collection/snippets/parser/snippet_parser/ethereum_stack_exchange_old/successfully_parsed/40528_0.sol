pragma solidity ^0.4.18;

contract TestFallback{
    uint public a = 0;
    uint public loopsize = 100;

    function updateLoopSize(uint _size) public {
        loopsize = _size;
    }

    function() public payable{
        uint i = 0;
        for (i=0; i<loopsize; i=i+1){
            a +=1;
        }
    }
}
