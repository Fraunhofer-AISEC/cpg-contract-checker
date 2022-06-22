pragma solidity ^0.5.0;

 contract ApprovalContract{
address public sender;
address public receiver;

function deposit(address _receiver) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;
     address payable _rec = receiver.make_payable();
     _rec.transfer(address(this).balance);
}



using address_make_payable for address;

}
 library address_make_payable {
function make_payable(address x) internal pure returns (address payable) {
  return address(uint160(x));
 }
 }
