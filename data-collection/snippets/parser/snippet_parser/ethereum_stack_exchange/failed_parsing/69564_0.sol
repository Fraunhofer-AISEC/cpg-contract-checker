pragma solidity ^0.4.17;

contract supplyChain {
    address public state;
    uint public unitCost = 10;
    uint public totalAmount = 0;

    function supplyChain() payable public{
        state = msg.sender;
    }

    function add_money() public payable {
        require(msg.value == totalAmount && totalAmount>0);
    }

    struct School{
        address schoolId;
        string name;
        string district;
        uint students;
        uint amountRequired;
    }

    function getbalance() external view returns(uint){
        return address(this).balance;
    }

    School[] public Schools;

    function addSchool(address schoolId,string memory name,string memory district,uint students) public {
        require(state == msg.sender);
        Schools.push(School(schoolId,name,district,students,students*unitCost));
    }

    function getTotalAmountToPay() public returns(uint){
        uint total = 0;
        for(uint i=0;i<Schools.length;i++){
            total+=Schools[i].amountRequired;
        }
        totalAmount = total;
        return total;
    }

    function allocateMoneyToSchools() public{
        for(uint i=0;i<Schools.length;i++){
            Schools[i].schoolId.transfer(Schools[i].amountRequired);   
        }
    }

}


**Error generated**

> transact to supplyChain.add_money errored: VM error: revert.
revert  The transaction has been reverted to the initial state.
Note: The constructor should be payable if you send value.


Even though the method is payable, still it shows the same error.
