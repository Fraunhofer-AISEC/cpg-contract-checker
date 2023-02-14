
pragma solidity ^0.8.4;

contract Sort {
    uint256[] unsortedArr;
    uint256[] sortedArr;

    event sort(uint256[]);

    function addElement(uint256 element) public {
        unsortedArr.push(element);
    }

    function sortOffChain() public {
        emit sort(unsortedArr);
    }

    function getSortedData(uint256[] memory sortedData) public {
        sortedArr = sortedData;
    }

    
    function getUnsortedArr() public view returns (uint256[] memory) {
        return unsortedArr;
    }

    function getSortedArr() public view returns (uint256[] memory) {
        return sortedArr;
    }
}
