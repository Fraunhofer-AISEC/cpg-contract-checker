pragma solidity ^0.8.0;

contract A {
    event Received(bytes);
    
    function redeemAssetsForBuyback(address[] calldata) external{
      emit Received(msg.data);
    }      
}

contract B{
    function initiateRedeem(address _contractA, address[] calldata address_array) external {
        
        (bool success, ) = _contractA.call(
            abi.encodeWithSignature("redeemAssetsForBuyback(address[])", address_array)
        );
        
        require(success);
    }
}
