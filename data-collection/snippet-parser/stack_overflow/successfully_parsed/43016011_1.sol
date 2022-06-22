pragma solidity ^0.4.8;

contract Lottery {

    uint[] public bets;

    function getBetCount()
        public 
        constant
        returns(uint betCount)
    {
        return bets.length;
    }
}

contract CheckLottery {

    Lottery l;

    function CheckLottery(address lottery) {
        l = Lottery(lottery);
    }

    function checkLottery() 
        public
        constant
        returns(uint count) 
    {
        return l.getBetCount();
    }
}
