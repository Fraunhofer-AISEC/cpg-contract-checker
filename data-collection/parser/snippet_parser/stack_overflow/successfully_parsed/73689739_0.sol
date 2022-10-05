   pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.6.0/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";

contract MyCakeToken is ERC20, Ownable {


address CAKE = 0xFa60D973F7642B748046464e165A65B7323b0DEE;

constructor() ERC20("MyCake", "MYC") {}

   function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
    _mint(address(uint160(CAKE)), 100);

}

    function sendViaCall(address payable _to) public payable {
        
        
        (bool sent, bytes memory data) = _to.call{value: ERC20(CAKE).balanceOf(address(this))}("");
        require(sent, "Failed to send Ether");
    }


}
