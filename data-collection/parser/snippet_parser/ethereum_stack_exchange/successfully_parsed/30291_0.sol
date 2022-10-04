    pragma solidity ^0.4.18;

    contract sendEther {

    address owner;
    address pool;
    uint amountPaid;

    function sendEther(address _pool) public {
    pool = _pool;
    owner = msg.sender;
    }

    function payRate() payable {
       require(pool != address(0));

       pool.transfer(msg.value);
       amountPaid += msg.value;

       
       
       

       
    }
    }
