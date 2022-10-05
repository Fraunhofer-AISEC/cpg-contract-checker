pragma solidity ^0.7.0;

contract Manmade {

    struct Customer {
        uint customerID;
        string nick;
    }

    Customer[] public customers;

    function CustomerFactory(uint _customerID,string memory _nick)public{
        customers.push(Customer(_customerID,_nick));
    }

    CustomerFactory(1,"Peter");
}
