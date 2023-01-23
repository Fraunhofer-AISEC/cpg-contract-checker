
pragma solidity ^0.8.10;

contract Test {

    struct customerId{
        address id;
        mapping(string=>uint) customerAmount;
        mapping(string=>uint) customerPayed; 
        bytes customer_address;
    }

    mapping(address=>customerId) _arrayCustomerId;

    function add() public {
        customerId storage customer = _arrayCustomerId[msg.sender];
        customer.id = address(msg.sender);
        customer.customerAmount["test"] = 1;
        customer.customerPayed["test1"] = 2;
        customer.customer_address = abi.encodePacked(msg.sender);
    }

    function getElement() external view returns(address, uint, uint, bytes memory){
        return (_arrayCustomerId[msg.sender].id, _arrayCustomerId[msg.sender].customerAmount["test"], _arrayCustomerId[msg.sender].customerPayed["test1"], _arrayCustomerId[msg.sender].customer_address);
    }

}
