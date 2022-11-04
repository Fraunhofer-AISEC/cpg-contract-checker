

pragma solidity >=0.7.0 <0.9.0;


contract Storage {

    int public start_date;
    address payable public owner;
    uint public amount_stored;
    int public timeOut;

    event Escrow(address owner, int time_out, uint amount_stored);

    constructor() payable {
        owner = payable(msg.sender);
    }

    function enter(int timeOutArg) public payable {
        require(msg.value > 0.001 ether, "not enough eth");
        require(timeOutArg < 10000 && timeOutArg > 0, "time out is not valid");
        require(msg.sender == owner, "you are not the owner");
        amount_stored = msg.value;
        start_date = int(block.timestamp);
        timeOut = timeOutArg;
        emit Escrow(owner, timeOutArg, msg.value);
    }

    function getTimeLeft() public view returns (int) {
        return start_date - int(block.timestamp)  + timeOut;
    }

    function payMoneyOut() public {
        require(msg.sender == owner, "you are not the owner");
        require(getTimeLeft() < 5 || getTimeLeft() > 10000, "escrow is not done yet");
        owner.transfer(amount_stored);
    }
}
