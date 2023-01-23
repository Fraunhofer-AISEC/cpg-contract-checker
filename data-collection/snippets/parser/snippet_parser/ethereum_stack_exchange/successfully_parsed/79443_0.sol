pragma solidity 0.5.1;

contract tictactoe {

    
    uint256 public playerCount;
    uint public betAmount;
    uint public totalBets;
    mapping(uint => Player) public player;
    address owner;

    
    enum State { Waiting, InProgress, Finished }
    State public state;

    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    
    struct Player {
        uint _id;
        uint _betAmount;
        address _owner;
    }

    constructor() public {
        owner = msg.sender;
        state = State.Waiting;
        playerCount = 0;
    }

    function remoteAdd() public payable {
        require(msg.value >= 0);
        incrementCount();
        betAmount = msg.value;
        owner = msg.sender;
        player[playerCount] = Player(playerCount, betAmount, owner);
        totalBets += betAmount;
    }

    function () external payable{
        remoteAdd();
    }

    
    function getBalance() public view returns(uint){
        return totalBets;
    }


    
    function incrementCount() internal {
        playerCount += 1;
    }

    
    
    function beginGame() public {
        require(playerCount == 2);
        state = State.InProgress;
    }

    function endGame() public {
        require(state == State.InProgress);
        state = State.Finished;
    }

    function payout() public returns (bool success){
       require(state == State.Finished); 
       msg.sender.transfer(totalBets);
       msg.sender.call.value(totalBets).gas(7000)("");
       return true;
    }

    function withdraw() public {
        uint bal = address(this).balance;
        msg.sender.transfer(bal);
    }

}
