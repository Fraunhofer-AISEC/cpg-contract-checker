pragma solidity ^0.5.1;
import "./AddressBook.sol";

contract Deal {
      AddressBook addressBook;
      address public owner;
      address public buyerAddr;  
      address private addr;
      string private metaData;
      uint private duration;
      uint private price;
      string private typeOfData;
      string private gateKeeper;


      event SafepaySent(address buyer, uint value, uint now);

      
     constructor(address _addressBook) public payable {

        
        owner = msg.sender;
        addressBook  = AddressBook(_addressBook);
        addressBook.addAddress(address(this),"test");
      }
      function getAddresses() public view returns (address[] memory) {
        return  addressBook.getAddresses();
        }
    }
