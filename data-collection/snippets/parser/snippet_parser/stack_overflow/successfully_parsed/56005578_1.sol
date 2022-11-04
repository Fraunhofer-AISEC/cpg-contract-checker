pragma solidity >=0.4.22 <0.6.0;
contract SLA{

 address payable seller;


event DepositFunds(address from, uint amount);

constructor() payable public {
    seller = msg.sender;
}


function transfertocontracts(uint amount) payable public{

}

function seePerson_Amount() public view returns(uint){
   return seller.balance;
}

function seeContract_Amount() public view returns(uint){
   return address(this).balance;
}

function Transfer_Contract_Amount() payable public{
    seller.transfer(address(this).balance);
}
}
