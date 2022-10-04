pragma solidity >=0.4.22 <0.6.0;

contract Lottery {
address payable public manager;
address payable [] public players; 

constructor () public {
    manager = msg.sender;
}
function enter() public payable {

    require(msg.value > 0.01 ether); 
    players.push(msg.sender);
}

function random() private view returns(uint) {
    return uint(keccak256(abi.encodePacked(block.difficulty, now, 
players)));
}

function pickWinner() public restricted{
    uint index = random() % players.length;
    players[index].transfer(address(this).balance);
    players = new address payable[](0); 

}

modifier restricted() {
    require(msg.sender == manager); 
    _;
}

function getPlayers() public payable returns (address[] memory) {
    return players;
    
    

}
}
