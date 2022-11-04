pragma solidity ^0.5.1;

contract Lottery {
    Game[] ListGames;
    
    uint price = 100000;
    uint[6] winnerGame;
    
    address payable[]  ListWinners;
    uint winnersPayed = 0;
    uint expiredGames = 0;

    struct Game {
        address payable gamer;
        uint[6] numbers;
        uint date;
        bool valid;
    }

    function setWinner(uint[6] memory _winnerGame) public {
        winnerGame = _winnerGame;
    }

    function findWinners() public returns (address payable[] memory) {
        uint size = ListGames.length;
        bool win = true;

        for (uint j = 0; j < size; j++) {
            for (uint i=0; i<6 ; i++) {
                if ((ListGames[j].numbers[i] != winnerGame[i]) || !ListGames[j].valid) {
                    win = false;
                }
            }

            if (win) {
                ListGames[j].valid = false;
                expiredGames ++;
                ListWinners.push(ListGames[j].gamer);
            }
        }
        return ListWinners;
    }

    function payer() public returns (uint) {
        uint nbWinners = ListWinners.length;
        uint prize;   
        if (nbWinners - winnersPayed != 0) {
            prize = address(this).balance / (nbWinners- winnersPayed);
            for (uint i = 0; i < nbWinners; i++) {
                if(ListWinners[i] != address(0)) {
                    ListWinners[i].transfer(prize);
                    delete ListWinners[i];
                    winnersPayed++;
                    require(ListWinners[i] == address(0));
                }
            }
        }
        return nbWinners;
    }

    modifier costs(uint amount) {
        require(msg.value >= amount);
        _;
    }

    function postGame(uint[6] memory _numbers) public payable costs(price) {
        Game memory newGame = Game(msg.sender, _numbers, block. timestamp, true);
        ListGames.push(newGame);
    }

    function numberValidGames() public view returns (uint) {
        return ListGames.length - expiredGames;
    }

    function getWinnersList() public view returns (address payable [] memory) {
        return ListWinners;
    }

    function getTime() public view returns (uint) {
        return block.timestamp;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
