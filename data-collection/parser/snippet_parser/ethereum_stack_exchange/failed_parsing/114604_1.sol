
pragma solidity ^0.8.0;

import "./IERC721.sol";

contract SimplePaymentWithRoyalty {
    struct Info {
        address token;
        uint tokenId;
    }

    uint _id;
    mapping (uint => Info) private _tokens;
    
    function listToken(address token, uint tokenId) external {
        IERC721(token).transferFrom(msg.sender, address(this), tokenId); 

        Info memory info = Info(
            token,
            tokenId,
        );

        _id++;
        _tokens[_id] = info;
    }
}
