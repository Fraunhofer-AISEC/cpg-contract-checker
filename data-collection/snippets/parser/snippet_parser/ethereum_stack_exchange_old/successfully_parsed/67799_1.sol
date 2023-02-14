pragma solidity ^0.4.24;

contract EthereumLottery {

    uint[6] array;
    uint[6] winners;
    string warning = "please be sure to bet below 67 for the first 5 balls and 34 for the 6th";
    address owner;
    uint addr = address(this).balance;
    uint nonce = 1;
    uint startTime = now;
    int8 fdsa;              

    constructor() public {
      owner = msg.sender;
    }

    function WARNING() public view returns (string memory) {
        return warning;
    }

    function PickYourNumbers(uint8 firstBall, uint8 secondBall, 
      uint8 thirdBall, uint8 fourthBall, 
      uint8 fithBall, uint8 powerballllll) public {
        if (firstBall <= 66) array[0] = firstBall;
        if (secondBall <= 66) array[1] = secondBall;
        if (thirdBall <= 66) array[2] = thirdBall;
        if (fourthBall <= 66) array[3] = fourthBall;
        if (fithBall <= 66) array[4] = fithBall;
        if (powerballllll <= 66) array[5] = powerballllll;
    }

    function GetHash() public view returns (uint[6] memory) {
        return array;
    }

                   
    function StartTheLotto(int8 asdf) public returns (uint[6] memory) {
        fdsa = asdf; 
        nonce++;
        winners[0] = random();
        nonce++;
        winners[1] = random();
        nonce++;
        winners[2] = random();
        nonce++;
        winners[3] = random();
        nonce++;
        winners[4] = random();
        nonce++;
        winners[5] = random();
    }


    function lottoWinners() public view returns (uint[6] memory) {
        return winners;
    }

    function random() private view returns(uint) {

        uint interval = now - startTime;

        bytes32 randomNum = keccak256(abi.encodePacked(interval + nonce + tx.gasprice + addr));

        uint number;
        for(uint i=0;i<randomNum.length;i++){
            number = number + uint(randomNum[i])*(2**(8*(randomNum.length-(i+1))));
        }
        return number % 67;
    }

}
