pragma solidity 0.8.x;

contract TestArray { 
    uint256 internal constant TOKENS_IN_POOL = 1_000_000e18;
    address internal attacker = 0xBAd0000000000000000000000000000000000Bad;

   function encode() public view returns(bytes memory) {
        bytes memory approvePaylaod = abi.encodeWithSignature("approve(address,uint256)",address(attacker),TOKENS_IN_POOL);
        return approvePaylaod;
   }

   function decode(bytes calldata approvePaylaod) public pure returns(address,uint256) {
        address addressAttacker;
        uint256 num;
        
        (addressAttacker,num) = abi.decode(approvePaylaod[4:], (address,uint256));
        return (addressAttacker,num);
   }
}
