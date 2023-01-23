
pragma solidity ^0.8.0;

import "./interfaces/IERC20.sol";

contract Airdrop {
    function airdropToken(
        address _token,
        address[] calldata _receivers,
        uint256[] calldata _amounts
    ) external {
        require(_receivers.length == _amounts.length, "_receivers.length not the same as _amounts.length");        
        for (uint256 i; i < _receivers.length; i++) {
            require(IERC20(_token).transferFrom(tx.origin, _receivers[i], _amounts[i]), "Token send failed");
        }
    }
}
