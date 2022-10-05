    pragma solidity ^0.5.6;

contract testContract {

    constructor () public payable{
    }

    function transferFunds () external payable {
      
        address(this).transfer(1 ether);

    }
    function refund () external payable {
        msg.sender.transfer(address(this).balance);
    }

    function showBalance ()  public returns  (uint256){
        return  address(this).balance;
    }
    function returnContractAdress () public returns (address){
       return address(this);
    }
}
