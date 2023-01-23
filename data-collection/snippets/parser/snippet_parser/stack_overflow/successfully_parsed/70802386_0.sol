
      pragma solidity >= 0.5.2;
      contract Lottery{
    address public manager;
    address[] public players;
    constructor()public{
        manager=msg.sender;
        
    }
    function enter() public payable{
        require(msg.value>0.01 ether);
        players.push(msg.sender);
    }
    function random() private view returns(uint){
      return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players)));
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function pickWinner() public restricted {
        address payable winner;
        uint index=random()% players.length;
        winner=payable(players[index]);
        winner.transfer(getBalance());
       players=new address[](0);
    }
    modifier restricted(){
        require(msg.sender==manager);
        _;
    }
    function getPlayers() public view returns(address[] memory){
        return players;
    }}