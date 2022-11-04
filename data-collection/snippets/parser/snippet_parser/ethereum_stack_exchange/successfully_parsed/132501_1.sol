    

    pragma solidity >=0.7.0 <0.9.0;

    contract ForLoop {


 function getOwnedTokens() public pure returns (uint[] memory) {
    uint numberOfOwnedTokens = 4;
    uint[] memory listOfOwnedTokens = new uint[](numberOfOwnedTokens);



    for(uint tokenIndex = 0; tokenIndex < numberOfOwnedTokens; tokenIndex++)  {
        listOfOwnedTokens[tokenIndex] = tokenIndex;
     }

    return listOfOwnedTokens;
}

}
