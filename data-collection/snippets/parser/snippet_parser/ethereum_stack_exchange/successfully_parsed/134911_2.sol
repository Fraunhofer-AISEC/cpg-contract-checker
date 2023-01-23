
pragma solidity ^0.8.6;

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
}
