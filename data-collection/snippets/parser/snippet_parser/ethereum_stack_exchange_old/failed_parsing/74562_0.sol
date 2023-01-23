Contract Eternal Storage:
    pragma solidity ^0.5.1;


    contract EternalStorage{

      struct Storage {
        mapping(bytes32 => address) _address;
        mapping(bytes32 => string) _string;
       }

      Storage internal s;

      address public owner;

     function setString(bytes32 h, string memory v) public  {
        s._string[h] = v;
     }

function getString(bytes32  h) public view returns (string memory){
    return s._string[h];
  }

function setAddress(bytes32 h, address v) public  {
    s._address[h] = v;
  }
function getAddress(bytes32 h) public view returns (address){
    return s._address[h];
  }
}
