pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/ownership/Ownable.sol";


contract MyToken is ERC20Detailed, ERC20Mintable, Ownable {    

    uint256 private msgCount;
    address constant ETHER = address(0);
    mapping(uint256 => string) private message;

    constructor(string memory name, string memory symbol, uint8 decimals, address _newOwner) ERC20Detailed(name, symbol, decimals) public {
        addMinter(_newOwner);
        renounceMinter();
        transferOwnership(_newOwner);
    }

    function doMint(uint256 _amount, address _beneficiary1, address _beneficiary2, address _beneficiary3) public onlyOwner {
        require (_amount >= 0);
        require(_beneficiary1 != ETHER && _beneficiary2 != ETHER && _beneficiary3 != ETHER);
        require(mint(_beneficiary1, _amount.mul(20).div(100)));
        require(mint(_beneficiary2, _amount.mul(30).div(100)));
        require(mint(_beneficiary3, _amount.mul(50).div(100)));
    }

    function setMessage(string memory _message) public onlyOwner {
        message[msgCount] = _message;
        msgCount = msgCount.add(1);
    }

    function readMessage(uint256 _msgId) public view returns(string memory) {
        return message[_msgId];
    }

    function transferRights(address _newOwner) public onlyOwner {
        addMinter(_newOwner);
        renounceMinter();
        transferOwnership(_newOwner);
    }
}
