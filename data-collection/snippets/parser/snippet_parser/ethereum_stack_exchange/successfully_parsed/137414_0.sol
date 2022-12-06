

pragma solidity ^0.8.0;

interface Dexes {
    function allPairsLength() external view returns (uint256);
}

contract callingDexInfo {
    address public constant uniswapV2 = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    Dexes dexAddress = Dexes(uniswapV2);

    function getAllPairs() public view returns (uint256) {
        uint256 all = dexAddress.allPairsLength();
        return all;
    }
}
