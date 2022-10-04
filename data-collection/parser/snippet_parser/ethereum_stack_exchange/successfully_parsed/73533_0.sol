  pragma solidity ^0.4.22;

  import "./standard/ERC721TokenReceiver.sol";

  contract ValidReceiver is ERC721TokenReceiver {

      event  LOGTokenFallBack(address from,bytes4 value);

      function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes _data) external returns(bytes4 value) {
            emit LOGTokenFallBack(_from, bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")));
            return 0x150b7a02;

     } 
} 
