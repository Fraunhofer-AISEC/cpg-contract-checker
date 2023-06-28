pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ReceiverERC20 is Ownable {

mapping(address => bool) public approvedERC20Address;

modifier onlyApprovedERC20 (address ERC20Address){
    require (approvedERC20Address[ERC20Address],"ReceiverERC20 : only transfer from approved erc20 is accepted");
    _;
}

event Deposited (uint TransactionID ,address Sender, address ERC20Address , uint value );

function changeERC20State (address ERC20Address,bool state) external onlyOwner()  {
    approvedERC20Address[ERC20Address] = state;
}
 
function depositERC20 (uint transactionID , address ERC20Address, uint value)  external onlyApprovedERC20 (ERC20Address){
    IERC20(ERC20Address).transferFrom(msg.sender, address(this), value);
    emit Deposited(transactionID,msg.sender,ERC20Address,value);
}

}
