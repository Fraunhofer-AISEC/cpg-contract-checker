pragma solidity >=0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    constructor () public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }

    function random() private view returns (uint256) {
        returns unit(keccak256(abi.encodePacked(block.difficulty, now, players)));
    }


}
