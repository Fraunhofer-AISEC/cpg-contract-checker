pragma solidity >=0.4.22 <0.6.0;

contract Lottery {
    address payable[] public  players; 
    address payable public manager; 

    
    constructor() public {
        
        manager = msg.sender; 
    }

    
    
    function () payable external {
        require(msg.value >= 0.01 ether);
        players.push(msg.sender); 
                                  
    }

    function get_balance() public view returns(uint) {
        require(msg.sender == manager);
        return address(this).balance; 
    }

    
    function random() public view returns(uint256) {
        return keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)); <--error is this line
    }

    function selectWinner() public view returns(address) {
        require(msg.sender == manager);
        uint r = random();
        address payable winner;

        
        uint index = r % players.length;
        winner = players[index];

        
        winner.transfer(address(this).balance);

        players = new address payable[](0); 
    }
 }
