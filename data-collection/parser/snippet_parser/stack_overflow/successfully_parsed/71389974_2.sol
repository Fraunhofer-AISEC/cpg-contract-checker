
pragma solidity 0.8.4;

struct Token {
    string name;
}

library TokenTrait {
    function getName(Token memory token) external pure returns (string memory) {
        return token.name;
    }
}

contract SampleNft {
    using TokenTrait for Token;

    uint tokenId;

    mapping(uint => Token) private _tokenIdTokenMap;

    constructor() {
        tokenId = 0;
    }

    function mint() external {
        Token memory token = Token("First Token");

        _tokenIdTokenMap[tokenId] = token;
    }

    function getName() external view returns (string memory) {
        Token memory token = _tokenIdTokenMap[tokenId];

        return token.getName();
    }
}
