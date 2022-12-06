pragma solidity ^0.6.0;

import "https://github.com/lukso-network/standards-implementations/blob/master/contracts/Accounts/LSP3Account.sol";

contract MyProfile is LSP3Account(msg.sender) {
    
}
