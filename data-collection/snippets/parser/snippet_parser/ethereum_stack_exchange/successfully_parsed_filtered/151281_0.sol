pragma solidity ^0.8.11;
contract UniqTicket
{
    
    uint public randNonce = 0;

    mapping(address => uint256[]) public participants;
    uint256[] public allTickets;

 
    function randMod(uint _modulus) public returns(uint){
        randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce, block.difficulty))) % _modulus;
    }


    function allotTickets(uint256 size) public{
        for(uint i=0; i<size; i++) {
            uint256 ticket = randMod(1000);
            participants[msg.sender].push(ticket);
            allTickets.push(ticket);
        }
    }

    function getTickets(address _user) public view returns(uint256[] memory) {
      return participants[_user];
    }

    function fetchAllTickets() public view returns(uint256[] memory) {
        return allTickets;
    }

}
