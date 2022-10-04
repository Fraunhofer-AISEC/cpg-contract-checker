
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract StakingExample is AccessControl {

    bytes32 public constant CONTRACT_ROLE = keccak256("CONTRACT_ROLE");
    NFTExample public _NFTExample;

    ...

    function someStakingFunction() {
        
        
    }

    function claimNFT(uint256 _pid, string memory _tokenURI) public onlyRole(CONTRACT_ROLE) {
        
        if (haveUnclaimed) {
            _NFTExample.mintItem(msg.sender, _tokenURI)
        }
    }
}
