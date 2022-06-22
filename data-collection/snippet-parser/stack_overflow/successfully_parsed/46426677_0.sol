pragma solidity ^0.4.11;

contract Casino {

    struct Bet {
        address by;
        uint number;
    }

    address owner;
    Bet[] bets;

    event BetPlaced(Bet bet);

    function Casino() {
        owner = msg.sender;
    }

    function bet(uint number) {
        Bet memory bet;
        bet.by = msg.sender;
        bet.number = number;

        bets.push(bet);

        BetPlaced(bet);
    }

    function getBets() constant returns (Bet[]) {
        return bets;
    }

    function getCount() constant returns (uint length) {
        return bets.length;
    }
}
