pragma solidity ^0.5.1;

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token.sol";



contract AirDropEarthDeeds is NFToken {
    bytes4 internal constant MAGIC_ON_ERC721_RECEIVED = 0x150b7a02;

    
    
    function claimPlot(int256 latitude, uint256 longitude) external {
        require (latitude >= -66 && latitude <= 66);
        require (longitude >= 0 && longitude < 360);

        uint tokenId = uint(180 + latitude) * 10000 + longitude;
        address to = msg.sender;
        _mint(to, tokenId);

        if (to.isContract()) 
        {
            bytes4 retval = ERC721TokenReceiver(to).onERC721Received(msg.sender, address(0), tokenId, "");
            require(retval == MAGIC_ON_ERC721_RECEIVED);
        }
    }
}
