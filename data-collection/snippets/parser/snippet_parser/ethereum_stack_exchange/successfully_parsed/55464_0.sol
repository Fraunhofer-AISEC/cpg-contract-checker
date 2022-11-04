pragma solidity ^0.4.21;

contract TaxContract {
    address public owner;
    event TaxRequest(int price);

    constructor() public {
       owner = msg.sender;
    }

    function calculateTax(int price) public {
       emit TaxRequest(price);
    }
}
