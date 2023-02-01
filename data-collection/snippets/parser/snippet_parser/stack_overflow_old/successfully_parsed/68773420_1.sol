
pragma solidity >=0.7.0 <0.9.0;

import "./Bridge.sol";

contract QueryDemo {
    int public bestChainHeight;
    bytes public returned;
    bytes32 public headerHash;
    
    function reverse(uint256 input) internal pure returns (uint256 v) {
        v = input;
    
        
        v = ((v & 0xFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00) >> 8) |
            ((v & 0x00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF) << 8);
    
        
        v = ((v & 0xFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000) >> 16) |
            ((v & 0x0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF) << 16);
    
        
        v = ((v & 0xFFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000) >> 32) |
            ((v & 0x00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF) << 32);
    
        
        v = ((v & 0xFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000) >> 64) |
            ((v & 0x0000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF) << 64);
    
        
        v = (v >> 128) | (v << 128);
    }

    function clear() public   {
        headerHash =0;
        returned = "";
    } 
    
    function getBridge() private pure returns (Bridge) {
        return Bridge(address(0x01000006));
    }
    
    function getBtcBlockchainBestChainHeight() public {
        bestChainHeight = getBridge().getBtcBlockchainBestChainHeight();
    }
    
    
    
    
    
    function storeBtcBlockchainBlockHashAtDepth(int256 depth) public  {
      returned  = getBridge().getBtcBlockchainBlockHashAtDepth(depth); 
    }
    
    function getHeaderHash(bytes memory x) private pure returns(bytes32) {
        bytes32 h = sha256(x);
        bytes32 h2 = sha256(abi.encodePacked(h));
        return bytes32(reverse(uint256(h2))); 
    }
    
    function computeHeaderHash() private {
        headerHash = getHeaderHash(returned);
    }
    
    function storeBtcBlockchainBestBlockHeader (  ) external {
        returned = getBridge().getBtcBlockchainBestBlockHeader();
        computeHeaderHash();
    }
    
    function getBtcBlockchainBestBlockHeader (  ) external view returns (bytes memory) {
        return getBridge().getBtcBlockchainBestBlockHeader();
   
    }
    
    function storeBtcBlockchainBlockHeaderByHash ( bytes32 btcBlockHash ) external {
        returned = getBridge().getBtcBlockchainBlockHeaderByHash ( btcBlockHash );
        computeHeaderHash();
    }
    
    function getBtcBlockchainBlockHeaderByHash ( bytes32 btcBlockHash ) external view returns (bytes memory) {
        return  getBridge().getBtcBlockchainBlockHeaderByHash ( btcBlockHash );
    }
    
    function storeBtcBlockchainBlockHeaderByHeight ( uint256 btcBlockHeight ) external {
        returned = getBridge().getBtcBlockchainBlockHeaderByHeight (btcBlockHeight);
        computeHeaderHash();
    }
    
    function getBtcBlockchainBlockHeaderByHeight ( uint256 btcBlockHeight ) external view returns(bytes memory ret) {
        return getBridge().getBtcBlockchainBlockHeaderByHeight (btcBlockHeight);
    }
    
    function storeBtcBlockchainParentBlockHeaderByHash ( bytes32 btcBlockHash ) external {
        returned = getBridge().getBtcBlockchainParentBlockHeaderByHash ( btcBlockHash);
        computeHeaderHash();
    }
    
    function getBtcBlockchainParentBlockHeaderByHash ( bytes32 btcBlockHash ) external view returns(bytes memory ret) {
        return  getBridge().getBtcBlockchainParentBlockHeaderByHash ( btcBlockHash);
    }
    
    function testGetParentParentHeader() public view returns(bytes memory ret) {
        bytes memory x = getBridge().getBtcBlockchainBlockHeaderByHeight (2064695);
        bytes32  h =getHeaderHash(x);    
        
        
        ret=getBridge().getBtcBlockchainParentBlockHeaderByHash ( h);
    }
    
    function testStoreGetParentHeader() public {
        returned = getBridge().getBtcBlockchainBlockHeaderByHeight (2064695);
        computeHeaderHash();    
        
        
        returned = getBridge().getBtcBlockchainParentBlockHeaderByHash ( headerHash);
        computeHeaderHash();
    }
}
