pragma solidity ^0.4.0;
contract Festival {


    address owner;
    uint8 max;
    address[] entered;

    function Festival(uint8 _max) {
        max = _max;
        owner = msg.sender;
    }

    function joinFestival()
    {
        if(entered.length < max)
            entered.push(msg.sender);
    }


}
