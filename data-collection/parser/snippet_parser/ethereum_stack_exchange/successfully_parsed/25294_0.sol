pragma solidity ^0.4.6;

contract Factory {

    bytes32[] Names;
    address[] newContracts;
    uint public count=0;

    function createContract (bytes32 name) {
        address newContract = new Contract(name);
        count=count+1;
        newContracts.push(newContract);
    } 

    function getName  (uint i) constant returns (address sblcAddress){
        Contract con = Contract(newContracts[i]);
      sblcAddress= address(con);
       return sblcAddress;
    }
}

contract Contract {

    bytes32 public Name;

    function Contract (bytes32 name) {
        Name = name;
    }
}
