
pragma solidity ^0.8.0;

import "./ITokens.sol";

contract MarketPlace  {
    ITokens private _tokens;

    constructor(address tokens) {
        _tokens = ITokens(tokens);
    }

    function getVideo(uint _id) external view returns (ITokens.Video memory) {
        return _tokens.getVideo(_id);
    }
    
    function mint() public returns(bool ){
        _tokens.createAd("kakakak");
        return true;
    }
}
