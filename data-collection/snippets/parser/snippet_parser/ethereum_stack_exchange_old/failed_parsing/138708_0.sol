
Ix{
  function deposit(uint8 a, bytes32 b, bytes calldata data) external payable returns (bytes memory);
}
contract Z{
    address handler= 0x000;
    address x= 0x000;
    function swap(uint8 a,bytes32 b,address srcToken, uint256 srcAmount,address recipientAddress)
    external payable {
                     
        IERC20(srcToken).transferFrom(msg.sender,address(this),srcAmount);  
        IERC20(srcToken).approve(handelIce, srcAmount);
 
        bytes memory data = abi.encodePacked(srcAmount, uint256(20), recipientAddress);
        IX(X).deposit(a,b,data);
    }
}    
