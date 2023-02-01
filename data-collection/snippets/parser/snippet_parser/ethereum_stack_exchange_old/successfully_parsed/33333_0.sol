pragma solidity ^0.4.18;

contract charity_tab{

  string [] public charity;
  uint public charitySize=0;

  function addCharity(string a) {
    charity.push(a);
    charitySize++;  
  }
}
