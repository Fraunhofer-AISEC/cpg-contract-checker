

pragma solidity ^0.8.18;

import {AFoundryCourseChallenge} from "AFoundryCourseChallenge.sol";

contract LessonOne is AFoundryCourseChallenge {
string private constant LESSON_IMAGE = "ipfs://QmYNk9TaRp9QDRjDZYxrwh5xQGMeC9zY23tB4fs5qby6KT";

constructor(address fcn) AFoundryCourseChallenge(fcn) {}


function solveChallenge(string memory yourTwitterHandle) external {
    _updateAndRewardSolver(yourTwitterHandle);
}




function description() external pure override returns (string memory) {
    return "Cyfrin Foundry Full Course: Awesome! You got the basics down! You minted an NFT!";
}

function attribute() external pure override returns (string memory) {
    return "Getting learned!";
}

function specialImage() external pure override returns (string memory) {
    return LESSON_IMAGE;
}
}
