pragma solidity ^0.4.24;

contract NumParser {
    string public numArray;
    uint256[] private tempContainer;
    uint256[] public shouldBe;

    constructor() public {
        numArray = "[\"31\", \"25\", \"24\"]";
        shouldBe.push(31);
        shouldBe.push(25);
        shouldBe.push(24);
        uint256[] memory result = parseNums(numArray);
        tempContainer.length = 0;
        for (uint256 i = 0; i < result.length; i++) {
            assert(result[i] == shouldBe[i]);
        }
    }

    function parseNums(string numsToParse) internal returns (uint256[]) {
        bytes memory converted = bytes(numsToParse);
        for (uint256 i = 0; i < converted.length; i++) {
            if (converted[i] == 34) {
                tempContainer.push(0);
                uint256 j = i + 1;
                for (; converted[j] != 34; j++) {
                    tempContainer[tempContainer.length - 1] += (uint256(converted[j]) - 48);
                    tempContainer[tempContainer.length - 1] *= 10;
                }
                tempContainer[tempContainer.length - 1] /= 10;
                i = j;
            }
        }
        return tempContainer;
    }
}
