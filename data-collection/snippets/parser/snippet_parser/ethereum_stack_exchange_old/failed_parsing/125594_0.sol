[...]
IINonfungiblePositionManager NFPosManager = INonfungiblePositionManager(0xC36442b4a4522E871399CD717aBDD847Ab11FE88);
[...]
function getUnclaimedFeeBalanceOfNFT(uint256 objectId) public view returns (bool _success, bytes memory data) {

     (_success, data) = address(NFPosManager).staticcall(abi.encodeWithSelector(INonfungiblePositionManager.collect.selector, INonfungiblePositionManager.CollectParams({
          tokenId: objectId,
          recipient: address(this),
          amount0Max: type(uint128).max,
          amount1Max: type(uint128).max
     })));
       
     return (_success, data);
}
