
pragma solidity 0.8.13;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Child is Ownable {

    address factory;

    constructor(address _factory) {
        factory = _factory;
    }
    
    function depositEth() public payable {}

    function ownerWithdraw() public onlyOwner {
        _withdrawEth(msg.sender);
    }

    function factoryWithdrawEth(address to)  public {
        require(msg.sender == factory);
        _withdrawEth(to);
    }

    function _withdrawEth(address account) internal {
        uint amount = address(this).balance;
        (bool success, ) = payable(account).call{value: amount}("");
        require(success, "Failed to send Ether");
    }
    
}

