
event PaidBeneficiary(address indexed sender, address indexed beneficiary, uint256 indexed amount);


(bool success, bytes memory response) = beneficiary.call{value: amount}("");
require(success, "Pay Beneficiary was not successful.");


if(success){
  emit PaidBeneficiary(msg.sender, beneficiary, amount);
}else{
  
}
