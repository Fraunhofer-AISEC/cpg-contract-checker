pragma solidity ^ 0.8.10;

contract Test_Lottery {

    address payable[] public Players;
    address payable public admin;


    constructor() {
        admin = payable(msg.sender);
    }

    modifier onlyAdmin {
        require(admin == msg.sender);
        _;
    }

    receive() external payable {
        require(msg.value >= 0.001 ether , "You haven't entered enough into the pot!");
        require(msg.sender != admin , "The admin cannot play!");
        for (uint i=0; i < Players.length; i++) {
            if (msg.sender == Players[i]) {
                { revert() ; }
            } else {
                Players.push(payable(msg.sender));
            }          
        }
    }

    function getLotteryValue() public view returns (uint) {
        return address(this).balance;
    }

    function getNumberOfPlayers() public view returns (uint) {
        return Players.length;
    }

    function random() internal view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, Players.length)));
    }

    function pickWinner() public onlyAdmin {
        address payable winner;
        require(Players.length >= 3 && address(this).balance >= 10 ether , "Not enough people have entered or the pot isn't big enough!" );
        winner = Players[random() % Players.length];
        winner.transfer(getLotteryValue());
        Players = new address payable[](0);
        }
        
    }
