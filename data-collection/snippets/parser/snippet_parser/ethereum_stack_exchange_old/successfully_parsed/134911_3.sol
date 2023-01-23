
pragma solidity ^0.8.6;

contract Contract {

    event Payment(address indexed from, address indexed to, string recipientName);

    function sendPayment(address from, address payable to, string memory recipientName) public payable {
        to.transfer(msg.value);
        emit Payment(from, to, recipientName);
    }

}

contract Oracle {
    

    address public owner;
    uint public variableRand;

    constructor () {
        owner = msg.sender;
    }

    function setRandomVariable (uint _varRand) external {
        require (msg.sender == owner, "Not owner");
        variableRand = _varRand;
    }

}

contract Play {

    
    address owner;
    uint public currentPrize = 0;
    int[] public currentGuess;
    uint[] public randNum = new uint[](5);
    Oracle oracle;

    mapping(address => SenderGuess[]) public senderGuesses;

    struct SenderGuess {
        address sender;
        uint256 blockNumber;
        uint256[] guesses;
        uint256 diff;
        uint256 prize;
    }

    constructor(Oracle _oracle) {
        oracle = _oracle;
    }

    event Log(uint gas);

    function showPoolBalance() public view returns(uint) {
        return address(this).balance;
    }

    function randMod() public view returns(uint) {
        
        
        return uint(keccak256(abi.encodePacked(oracle.variableRand(), block.timestamp, block.difficulty, msg.sender))) % 1000;
    }

    function inputGuess(int _guess) public {
        
        currentGuess.push(_guess);
    }

    function clearGuesses() public {
        for (uint i = 0; i < currentGuess.length; i++) {
            
            currentGuess.pop();
        }
    }

    function abs(int x) private pure returns (int) {
        
        return x >= 0 ? x : -x;
    }



    function game() private returns (int, uint) {

        for (uint i = 0; i <= 5; i++) {
            randNum[i] = randMod();
            int absv = abs(int(randNum[i]) - currentGuess[i]);
           if (absv < 6 && absv > 0) {
               currentPrize += 2;
           }
           else if (absv == 0) {
               currentPrize += 4;
           }
           else if (absv < 16 && absv > 5) {
               currentPrize += 1;
           }
           return (absv , randNum[i]);
        }

    }

    function play() public payable returns (int, uint) {

        require(msg.value == (10 ether), "You must pay with 10 ethers!");
        game();
    }

    
    
    function playv2(uint256[] memory guesses) public payable returns (uint256) {
        require(msg.value == (10 ether), "You must pay with 10 ethers!");
        require(guesses.length == 5, "You need to send 5 guesses");

        uint256 _currentPrize = 10;

        
        
        uint256 randNumber = randMod();

        for(uint256 i = 0; i < guesses.length; i++) {

            uint256 guess = guesses[i];
            uint256 min = randNumber > guess ? randNumber : guess;
            uint256 max = guess > randNumber ? guess : randNumber;

            uint256 diff = max - min;

            if (diff == 0) {
                _currentPrize += 4;
            } else if (diff < 6) {
               _currentPrize += 2;
           } else if (diff < 16) {
               _currentPrize += 1;
           }

        }

        return _currentPrize;

    }

    
    
    function playv3(uint256[] memory guesses) public payable {
        require(msg.value == (10 ether), "You must pay with 10 ethers!");
        require(guesses.length == 5, "You need to send 5 guesses");

        uint256 _currentPrize = 10;

        
        
        uint256 randNumber = randMod();

        uint256 smallestDiff = 16;

        for(uint256 i = 0; i < guesses.length; i++) {

            uint256 guess = guesses[i];
            uint256 min = randNumber > guess ? randNumber : guess;
            uint256 max = guess > randNumber ? guess : randNumber;

            uint256 diff = max - min;

            if(diff < smallestDiff) {
                smallestDiff = diff;
            }

        }

        if (smallestDiff == 0) {
            _currentPrize += 4;
        } else if (smallestDiff < 6) {
            _currentPrize += 2;
        } else if (smallestDiff < 16) {
            _currentPrize += 1;
        }

        SenderGuess memory senderGuess = SenderGuess(msg.sender, block.number, guesses, smallestDiff, _currentPrize);

        senderGuesses[msg.sender].push(senderGuess);

    }


}
