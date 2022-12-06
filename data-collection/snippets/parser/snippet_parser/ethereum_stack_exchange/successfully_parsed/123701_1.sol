
pragma solidity >=0.7.0;

contract storageb{
  struct people{
    uint256 favN;
    string name;
  }

  people[] public array;
  mapping(string => uint256) public nameToFavNumber;

  function addPerson( string memory _name,uint _favN) public{
    array.push(people(_favN, _name));
    nameToFavNumber[_name]=_favN;
  }

}
