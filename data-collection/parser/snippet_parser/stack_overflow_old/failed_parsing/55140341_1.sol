AddressBook smart contract:


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

      
      function Deal(address _addressBook) public payable {

        
        owner = msg.sender;
        AddressBook a = AddressBook(_addressBook);
        a.addAddress(owner,"test");
      }
    }
      function getAddresses(address _addressBook) public view returns (address[]) {
        return  AddressBook(_addressBook).getAddresses();
        }
    }

    contract AddressBook {

        function getAddresses() public view returns (address[]);

        function addAddress(address addr, string _alias) public payable ;

        function removeAddress(address addr) public payable;

        function getAlias(address addr) public view returns (string);
    }
