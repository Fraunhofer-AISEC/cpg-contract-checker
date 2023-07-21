

pragma solidity ^0.8.18;

import {AFoundryCourseChallenge} from "AFoundryCourseChallenge.sol";
import {LessonThreeHelper} from "3-LessonHelper.sol";

contract LessonThree is AFoundryCourseChallenge, LessonThreeHelper {
    error LessonThree__WrongLocation();

    string private constant LESSON_IMAGE = "ipfs://QmfWyPRrx1sx7sfgrwr4pNMWtqVLXMwCP4fej39m2fPfYe";

    constructor(address fcn) AFoundryCourseChallenge(fcn) {
        s_booleanArray = [false, false, false, true, false];
    }

    
    function solveChallenge(uint256 location, uint256 newLocation, string memory yourTwitterHandle) external {
        if (s_booleanArray[location] != true) {
            revert LessonThree__WrongLocation();
        }
        s_booleanArray[location] = false;
        s_booleanArray[newLocation] = true;
        _updateAndRewardSolver(yourTwitterHandle);
    }

    
    
    
    function description() external pure override returns (string memory) {
        return "Cyfrin Foundry Full Course: You've inherited skillz from solidity!";
    }

    function attribute() external pure override returns (string memory) {
        return "Inheritance and factory pattern knowledgable";
    }

    function specialImage() external pure override returns (string memory) {
        return LESSON_IMAGE;
    }
}
