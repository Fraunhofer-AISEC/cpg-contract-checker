
contract SLA{

    address seller;


    event DepositFunds(address from, uint amount);

    constructor() payable public {
        seller = msg.sender;
    }


    function transfertocontracts(uint amount) public{
       address(this).transfer(amount);
    }

    function seePerson_Amount() public view returns(uint){
       return seller.balance;
    }

    function seeContract_Amount() public view returns(uint){
       return address(this).balance;
    }

    function Transfer_Contract_Amount() public{
       seller.transfer(address(this).balance);
    }
}
