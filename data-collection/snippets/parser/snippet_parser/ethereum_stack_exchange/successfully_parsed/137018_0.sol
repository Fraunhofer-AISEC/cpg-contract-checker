pragma solidity 0.8.11;

import "../interfaces/ISpool.sol";


abstract contract VaultBase is IVaultBase, VaultImmutable, SpoolOwnable, SpoolPausable, BaseConstants {
    using Bitwise for uint256;
    using SafeERC20 for IERC20;

    

    
    ISpool internal immutable spool;   
                                       

}
