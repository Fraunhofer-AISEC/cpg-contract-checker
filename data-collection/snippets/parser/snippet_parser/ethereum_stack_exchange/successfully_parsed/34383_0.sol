pragma solidity ^0.4.0;


contract PayCheck {
    
    address[] employees = [0x9391ea51c338410B6603e38dD14C00a1b218C8d5, 0x9391ea51c338410B6603e38dD14C00a1b218C8d5 ];

    
    uint totalReceived = 0;

    
    mapping (address => uint) withdrawnAmounts;

    
    function PayCheck() payable {
        updateTotal();
    }
    function () payable {
        updateTotal();
    }
    
    function updateTotal() internal {
        totalReceived += msg.value;
    }

    
    modifier canWidthdraw() {
        bool contains = false;

    
        for(uint i = 0; i < employees.length; i++) {
            if(employees[i] == msg.sender) {
                contains = true;
            }
        }
        require(contains);
        _;
    }

    
    function withdraw() canWidthdraw {
        uint amountAllocated = totalReceived/employees.length;
        uint amountWithdrawn = withdrawnAmounts[msg.sender];
        uint amount = amountAllocated - amountWithdrawn;
        withdrawnAmounts[msg.sender] = amountWithdrawn + amount;
        if (amount > 0) {
            msg.sender.transfer(amount);
        }
    }

}
