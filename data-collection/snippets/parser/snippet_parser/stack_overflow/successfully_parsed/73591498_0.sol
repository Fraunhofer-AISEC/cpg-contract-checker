contract Lottery{
    address public manager;
    address payable[] public participants; 

    constructor(){
        manager = msg.sender;   
    }

    receive() external payable{       
        require(msg.value == 1 ether);
        participants.push(payable(msg.sender));
    } 

    function getMoney() public view returns(uint){
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }
   

    function selectWinner() public{
        require(msg.sender == manager);
        require(participants.length >= 3);
        uint r = random();
        address payable winner;
        uint index = r % participants.length;   
        winner = participants[index];
        winner.transfer(getMoney());   
    }

    function showWinner() public view returns(address){
         return winner.transfer(getMoney());
    }
}

