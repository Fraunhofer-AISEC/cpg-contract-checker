
pragma solidity >=0.7.0 <=0.8.4;

contract Lottery {
    
    address payable public manager;
    address payable[]  public players;
    
    constructor (){
        
        manager = payable(msg.sender);
    }
    
    function enter() public payable {
        
        require(msg.value > .01 ether);
        players.push(payable(msg.sender));
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp)));

    }
    
    function pickWinner() public restricted {
        uint index = random() % players.length;
        
        players[index].transfer(address(this).balance);
        
        players = new address payable[](0);
    }
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function getPlayers() public view returns (address payable[] memory ) {
        return players;
    }
}   
