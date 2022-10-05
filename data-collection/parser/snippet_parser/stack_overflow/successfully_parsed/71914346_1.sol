    
    
pragma solidity >=0.4.17 <0.9.0;

    
contract Lottery {
    address public manager;
    address payable[] public players;

    constructor() {
        manager = msg.sender; 
    }

    function enter() public restricted payable {
        require(msg.value >= .01 ether);    
        players.push(payable(msg.sender));
    }
    
    function random() private view restricted returns(uint) {  
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp , players)));          
    
    }

    function pickWinner() public {
        require(msg.sender == manager);             
            
        uint index = random() % players.length;     
                                                        
        players[index].transfer(address(this).balance);                 
                                                                        
        players = new address payable[](0);        
    }
    
    modifier restricted() {                 
        require(msg.sender == manager);
        _;              
    }
    
    function getPlayers() public view returns(address[] memory) {
        return players; 
    }
    
}
