    address payable[] public players;
    mapping(address => uint256[])  playerTicket;
        
        
    function playersRecord() public view returns(uint256[] memory){
                return playerTicket[msg.sender];
    }
