pragma solidity ^0.4.23;
contract Test {
    event Event(address indexed wallet);

    mapping (address => bool) public authorizedWallets;

    uint256 public authorizedWalletCount;

    function add(address _wallet) external {
        _add(_wallet);
        emit Event(_wallet);
    }

    function _add(address _wallet) private {
        require(!authorizedWallets[_wallet]);
        authorizedWallets[_wallet] = true;
        authorizedWalletCount++;
    }
}
