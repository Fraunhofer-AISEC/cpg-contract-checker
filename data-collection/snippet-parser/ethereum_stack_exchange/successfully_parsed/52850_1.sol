pragma solidity ^0.4.23;  

contract MyContract {   
    address public createdBy;   
    string public stringOne;   
    string public stringTwo;   
    string public stringThree;    

    constructor(address sender, string one, string two, string three) public {     
        createdBy = sender;     
        stringOne = one;     
        stringTwo = two;     
        stringThree = three;   
    }    

    function getContractSummary() public view returns(address, string, string, string) {     
        return (       
            createdBy,       
            stringOne,       
            stringTwo,       
            stringThree     
        );   
    } 
}
