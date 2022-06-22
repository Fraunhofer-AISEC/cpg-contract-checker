
pragma solidity ^0.8.0;
import "V2.sol";

contract V3 is V2 {
    
    using CountersUpgradeable for CountersUpgradeable.Counter;
    

    function totalSupply() public view returns (uint256) {
        return _tokenIds.current();
    }
}
