pragma solidity ^0.4.24;

contract FancyContract {
    struct FancyStruct {
         address from;
         address to;
         mapping (address => uint256) balances;
    }

    FancyStruct public fancyStruct;

    function fancyFunction()
    public 
    {
        fancyStruct = FancyStruct({
            from: address(0x01),
            to: address(0x02)
        });
        fancyStruct.balances[address(0x01)] = 10;
        fancyStruct.balances[address(0x02)] = 20;
    }
}
