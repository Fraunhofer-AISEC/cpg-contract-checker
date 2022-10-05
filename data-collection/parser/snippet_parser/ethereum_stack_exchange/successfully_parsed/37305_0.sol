pragma solidity ^0.4.18;

contract mortal{

    address public owner;

    function mortal() public {

        owner = msg.sender;
    }

    modifier onlyOwner{

        if(msg.sender == owner) { 
            revert();
        }else{
            _;
        }
    }

    function kill() onlyOwner public {

        selfdestruct(owner);
    }
}

contract Borrower is mortal {
    string  public borrowerName;
    uint256 public funds;

    function Borrower(string _name) payable public {
        borrowerName     = _name;
    }

    function addFunds() onlyOwner payable public {
        
        funds += msg.value;
    }
} 
