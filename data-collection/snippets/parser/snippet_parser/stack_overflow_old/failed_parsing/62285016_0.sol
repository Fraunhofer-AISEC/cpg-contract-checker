pragma solidity ^0.5.0;



contract A {

  address public contract_A_address =address(this);
  address public owner_A = msg.sender;



}


contract B {

  address public contract_B_address =address(this);
  address public owner_B = msg.sender;

  A first = new A();


  function Get_first_Address() public view returns(address){
    return address(first);
    }

    function Get_Contract_A_Address() public view returns(address){
    return ??? ;
    }

}
