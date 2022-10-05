   pragma solidity ^0.4.2;

contract donation {
    address owner;
    modifier onlyowner {
        if (msg.sender == owner) _;
        }
    address[] _giver;

function Donation() public {
        owner = msg.sender;
    }


function donate() public payable {
        if (msg.value == 0) {
        revert();
        }
      addGiver(msg.sender);
    }

   
function moveFund() public onlyowner{
      owner.transfer(this.balance);
    }


function addGiver(address _a) internal {
        _giver.push(_a);
    }
}
