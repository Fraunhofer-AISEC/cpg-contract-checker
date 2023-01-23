pragma solidity ^0.8.0;

contract lotteryBot {

    address owner;
    address casino;
    scratchoff _t;

    constructor(){
        owner = msg.sender;
        casino = 0xGG4767f31960394B6c5770478e1GrB2Av97f0Ce8;
        _t = scratchoff(casino);
    }

    function fundBot() public payable{
    }


    function getTicket() private {
        (bool success,) = casino.call{value: 2 ether}("");
        require(success, "Fail at stage one");
        _t.buyTicket();
    }

    function playLottery() private {
        _t.play(2);
    }

    function killCasino() public {
        while(true){
            getTicket();
            playLottery();
        }
    }

    function retrieveFunds() public{
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success, "Not paid");
    }
}

abstract contract scratchoff{
    function buyTicket() public virtual;
    function play(uint num) public virtual;
    function takePayout() public virtual;

}
