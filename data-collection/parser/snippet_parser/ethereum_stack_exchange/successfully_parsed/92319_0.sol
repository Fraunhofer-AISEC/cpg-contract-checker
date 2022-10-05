pragma solidity >=0.7.0 <=0.8.0;


contract Lottery{

    address public manager;
    address payable [] public players;

    constructor() {
        manager = msg.sender;
    }

    function getManager() public pure returns (string memory)
    {
        return '123';
    }

    function enter() public payable {

        require(msg.value> .001 ether);

        players.push(payable(msg.sender));
    }

    function pickWinner() public restricted {

        uint index = random() % players.length;
        address payable winner = players[index];
        winner.transfer(address(this).balance);

        players = new address payable [](0);
    }


    function random() private view returns (uint) {
       return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players)));
    }


    function getPlayers() public view returns ( address payable[] memory){
        return players;
    }


    modifier restricted(){
        require(manager == msg.sender);
        _;
    }


}
