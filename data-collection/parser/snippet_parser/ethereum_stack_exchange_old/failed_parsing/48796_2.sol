pragma solidity ^0.4.23;

import "./ERC721Basic.sol";
import "./ERC721Receiver.sol";
import "./SafeMath.sol";
import "./AddressUtils.sol";




contract ERC721BasicToken is ERC721Basic {

    .
    .
    .

    
    
    bytes4 constant ERC721_RECEIVED = 0xf0b9e5ba;

    .
    .
    .

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes _data) public canTransfer(_tokenId) {
        transferFrom(_from, _to, _tokenId);
        
        require(checkAndCallSafeTransfer(_from, _to, _tokenId, _data));
    }

    .
    .
    .

    
    
    
    
    
    
    
    function checkAndCallSafeTransfer(address _from, address _to, uint256 _tokenId, bytes _data) internal returns (bool) {
        if (!_to.isContract()) {
            return true;
        }
        bytes4 retval = ERC721Receiver(_to).onERC721Received(_from, _tokenId, _data);
        return (retval == ERC721_RECEIVED);
    }

}
