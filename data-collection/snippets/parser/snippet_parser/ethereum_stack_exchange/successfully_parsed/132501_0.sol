    

pragma solidity >=0.7.0 <0.9.0;

contract ForLoop {


     function getOwnedTokens() public pure returns (uint[] memory) {

        uint[] memory listOfOwnedTokens;

        uint numberOfOwnedTokens = 4;

        for(uint tokenIndex = 0; tokenIndex < numberOfOwnedTokens; tokenIndex++)  {
            listOfOwnedTokens[tokenIndex] = tokenIndex;
         }

        return listOfOwnedTokens;
    }

}
