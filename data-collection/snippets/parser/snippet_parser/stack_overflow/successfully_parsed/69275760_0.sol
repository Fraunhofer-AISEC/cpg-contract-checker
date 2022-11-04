contract Lottery {
    address public manager;
    address[] public  players;
    constructor() public {
        manager = msg.sender;
    }
    modifier restricted() {
        require(msg.sender == manager,"only manager has access");
        _;
    }
    function balanceInPool()public view returns(uint){
        return address(this).balance;
    }
    function enter() public payable {
        require(msg.value > .01 ether,"the amount should be more than 0.1 ether");
        players.push(msg.sender);
   }
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty,now,players)));
    }
    function pickWinner() public restricted {
        uint index = random() % players.length;
        address payable winner = payable(players[index]);
        players = new address[](0);
        winner.transfer(address(this).balance);
     }

    function getPlayers()public view returns(address[] memory){
    return players;
    }

        
}
```
