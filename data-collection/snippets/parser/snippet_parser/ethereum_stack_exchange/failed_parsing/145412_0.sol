pragma solidity >= 0.4.0 < 0.9.0;
import "D:/Msc/third_Sem/Project/BlockchainVoting/solcrypto/contracts/AOSRing.sol"; 
contract ElectionContract {
...
function verifyRingSignature( uint256[] memory pubkeys, uint256[] memory tees, uint256 seed, uint256 message ) public view returns(bool) {
        return AOSRing.Verify(pubkeys, tees, seed, message);
}
