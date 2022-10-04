pragma solidity 0.4.24;

  contract Overflow {
    uint8 iWantToBeCrossed;

    function OverflowMe() public
    {
        iWantToBeCrossed = 100;
        iWantToBeCrossed += 200;

    }

    function ShowMeTheValue () public   view returns (uint8){
        return iWantToBeCrossed;
    }
}
