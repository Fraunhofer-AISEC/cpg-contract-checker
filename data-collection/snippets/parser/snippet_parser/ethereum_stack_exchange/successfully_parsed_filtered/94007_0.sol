pragma solidity ^0.4.18;

import "./TimeLockedWallet.sol";

contract TimeLockedWalletFactory {

    mapping(address => address[]) wallets;

    function getWallets(address _user)
        public
        view
        returns(address[])
    {
        return wallets[_user];
    }

    function newTimeLockedWallet(uint256 _unlockDate)
        payable
        public
        returns(address wallet)
    {
        
        wallet = new TimeLockedWallet(msg.sender, _unlockDate);

        
        wallets[msg.sender].push(wallet);

        
        wallet.transfer(msg.value);

        
        Created(wallet, msg.sender, now, _unlockDate, msg.value);
    }

    
    function () public {
        revert();
    }

    event Created(address wallet, address to, uint256 createdAt, uint256 unlockDate, uint256 amount);
}
