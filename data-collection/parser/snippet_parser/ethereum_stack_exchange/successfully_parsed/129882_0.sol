pragma solidity >=0.4.22 <0.9.0;

contract Lottery {

    struct Ticket {
        address payable playerAddress;
        uint256 potAtParticipation;
        uint256 potWithStake;
    }

    Ticket[] tickets;

    constructor() {
       _createLottery();
    }

}