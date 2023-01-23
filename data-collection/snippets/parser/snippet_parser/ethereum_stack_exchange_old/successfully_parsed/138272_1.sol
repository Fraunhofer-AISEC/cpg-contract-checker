
pragma solidity ^0.8.9;

import "../ERC721OffchainPermit.sol";

contract MockERC721OffchainPermit is ERC721OffchainPermit {
    function mint(address _to, uint256 _value) external {
        _mint(_to, _value);
    }
}
