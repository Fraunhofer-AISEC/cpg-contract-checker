
pragma solidity >=0.4.16 <0.9.0;


contract SolveContract {
    
    bool forTestingPurposes;    
    
    TemplateTestContract testContract;  
    address payable owner;              

    
    constructor(address testAddress) public payable {
        testContract = TemplateTestContract(testAddress);   
        owner = msg.sender;                                 
    }
    
    
    function solve() public payable returns(uint256){
        testContract.differentFunctionName(owner);
        return owner.balance;
    }

    
    
    function main(uint x) pure public returns(uint y) {
        uint z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }
    
    
    
    function getOwner() public view returns (address) { 
        return owner;
    }
    
    
    function getAddressThis() public view returns (address) { 
        return address(this);
    }
    
    
    function getBalance() public view returns (uint) {
        
        
        return owner.balance;
    }
    
    
    function getForTestingPurposes() public view returns (bool){   
        return forTestingPurposes;
    }
    
}


abstract contract TemplateTestContract {
    function differentFunctionName(address payable hunter) public virtual;
}

