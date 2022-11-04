pragma solidity ^0.4.24;

contract NumParser {
    string[] public numArray;
    uint256[] public shouldBe;

    constructor() public {
        numArray.push("31");
        numArray.push("25");
        numArray.push("24");
        shouldBe.push(31);
        shouldBe.push(25);
        shouldBe.push(24);
        uint256[] memory result = parseNums(numArray);
        for (uint256 i = 0; i < result.length; i++) {
            assert(result[i] == shouldBe[i]);
        }
    }

    function parseNums(string[] numsToParse) internal pure returns (uint256[]) {
        uint256[] memory parsed = new uint256[](numsToParse.length);
        for (uint256 i = 0; i < numsToParse.length; i++) {
            bytes memory temp = bytes(numsToParse[i]);
            for (uint256 j = 0; j < temp.length; j++) {
                parsed[i] += (uint256(temp[j]) - 48) * (10**(temp.length - 1 - j));
            }
        }
        return parsed;
    }
}
