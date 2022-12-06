

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

pragma solidity ^0.8.0;

contract Market is IERC721Receiver  {

    event DataRecieved(uint256 tokenid, string message);


    function onERC721Received(address operator,
        address from,
        uint256 tokenId,
        bytes memory data) public override returns (bytes4)    
    {
        emit DataRecieved(tokenId, "call recieved");       
        return this.onERC721Received.selector;
    }    
}
