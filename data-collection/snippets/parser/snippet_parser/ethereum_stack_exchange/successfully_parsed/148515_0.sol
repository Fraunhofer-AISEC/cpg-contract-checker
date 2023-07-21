
pragma solidity ^0.8.13;

contract Shuffle {

    constructor() {
        ranking = [0,1,2,3,4,5,6,7];
        currentSeason = SeasonType.Spring;
    }

    enum SeasonType {
        Spring,
        Summer,
        Fall,
        Winter
    }

    uint256[] public ranking;
    SeasonType public currentSeason;

    function shuffleRankingsManual() external {
        uint256[] memory arr = ranking;

        for (uint256 i = 0; i < arr.length; i++) {
            uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, block.gaslimit, i)));
            uint256 j = i + (randomNumber % (arr.length - i));

            uint256 temp = arr[j];
            arr[j] = arr[i];
            arr[i] = temp;
        }

        ranking = arr;

        uint256 randomNumber1 = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, block.gaslimit)));

        uint256 newSeasonIndex = randomNumber1 % 4;

        currentSeason = SeasonType(newSeasonIndex);
    }
}
