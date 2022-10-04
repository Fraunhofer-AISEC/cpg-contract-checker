pragma solidity ^0.8;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol";

contract MyContract {
    function foo() external pure returns (bool) {
        address recovered = ECDSA.recover(
            0x8144a6fa26be252b86456491fbcd43c1de7e022241845ffea1c3df066f7cfede, 
            0x1c, 
            0x285e6fbb504b57dca3ceacc851a7bfa37743c79b5c53fb184f4cc0b10ebff6ad, 
            0x245f558fa13540029f0ee2dc0bd73264cf04f28ba9c2520ad63ddb1f2e7e9b24 
        );
        
        return recovered == address(0x0647EcF0D64F65AdA7991A44cF5E7361fd131643);
    }
}
