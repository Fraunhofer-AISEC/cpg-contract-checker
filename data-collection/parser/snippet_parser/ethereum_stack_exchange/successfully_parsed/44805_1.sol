pragma solidity ^0.4.18;
import "http://github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";
import "http://github.com/OpenZeppelin/zeppelin-solidity/contracts/math/SafeMath.sol";

contract Service is Ownable {

    using SafeMath for uint256;

    event DidMakePayment(address player, uint256 value);
    event DidAddFunds(uint amount, uint balance);

    function Service() public {}

    function execute() payable public onlyOwner {
        uint amount = address(this).balance;
        
        owner.transfer(amount);
        emit DidMakePayment(owner, amount);
    }

    function addFunds() payable { emit DidAddFunds(msg.value, address(this).balance); }

    function getBalance() public view returns (uint256) { return address(this).balance; }
}
