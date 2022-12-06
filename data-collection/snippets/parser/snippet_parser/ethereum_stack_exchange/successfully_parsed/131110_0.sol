
pragma solidity ^0.8.7;

contract CalculateStringsMode {

    mapping(string => uint256) public stringCountMapping;

    string public mode = "";

    function findMostOccurringString(string[] memory arr)
        public
        returns (string memory)
    {

        

        uint256 maxCount = 0;

        uint256[] memory countList = new uint256[](arr.length);

        for (uint256 i = 0; i < arr.length; i++) {
            stringCountMapping[arr[i]] += 1;
        }

        for (uint256 i = 0; i < arr.length; i++) {
            countList[i] = stringCountMapping[arr[i]];
        }

        for (uint256 i = 0; i < countList.length; i++) {
            if (countList[i] > maxCount) {
                maxCount = countList[i];
            }
        }

        for (uint256 i = 0; i < arr.length; i++) {
            if (maxCount == stringCountMapping[arr[i]]) {
                mode = arr[i];
                break;
            }
        }

        return mode;
    }
}
