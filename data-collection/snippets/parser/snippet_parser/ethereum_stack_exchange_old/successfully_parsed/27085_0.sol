pragma solidity ^0.4.11;







contract CustomerTemplate {

    bytes32 public customerName;
    bytes32 public customerLoc;

    function CustomerTemplate (bytes32 _customerName, bytes32 _customerLoc)  {

        customerName    = _customerName;
        customerLoc     = _customerLoc;

    }

}






contract Master is CustomerTemplate{

    address public owner;
    bytes32 public ownerName;
    address[] newCustomers;

    modifier onlyByMaster()  {
        require(msg.sender == owner);
        _;
    }

    function Master (bytes32 _ownerName) {

        owner = msg.sender;
        ownerName = _ownerName;
    }

    function createCustomer (bytes32 _customerName, bytes32 _customerLoc) {

        address myCustomer = new CustomerTemplate(_customerName, _customerLoc);
        newCustomers.push(myCustomer);
    }

    function killContract() constant onlyByMaster {

        if (msg.sender == owner) selfdestruct(owner);

    }

}
