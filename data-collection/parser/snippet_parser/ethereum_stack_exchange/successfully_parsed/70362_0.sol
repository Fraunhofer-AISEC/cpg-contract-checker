pragma solidity >=0.4.22 <0.6.0;
contract users {

struct userData{
   string fName;
   string lName;
} 

mapping(address => userData) userAddressToData;

}
