pragma solidity ^0.4.25;

contract CrowdFunding {

    struct Investor {

        address addr;

        uint amount;
 }

address public owner;

uint public numInvestors;

uint public _starting;
uint public deadline;
uint public _current;

string public status;

bool public ended;
uint public goalAmount;
uint public totalAmount;

mapping (uint => Investor) public Investors;

modifier onlyOwner () {     
    require(msg.sender == owner, "Not owner");
    _;
}

modifier notEnded () {
    require (!ended, "Crowfunding ended.");
    _;
}

modifier deadlineReached () {
    require (now >= deadline, "Crowfunding still running.");
    _;
}

constructor(uint _duration, uint _goalAmount) public {

    owner = msg.sender;

    _starting = now;
    deadline = _starting + _duration;

    goalAmount = _goalAmount;

    status = "Funding";

    ended = false;

    numInvestors = 0;

    totalAmount = 0;
}

function fund() public payable notEnded {

    Investor storage inv = Investors[numInvestors++];

    inv.addr = msg.sender;

    inv.amount = msg.value;

    totalAmount += inv.amount;

}


function checkGoalReached () public onlyOwner notEnded deadlineReached {

    if(totalAmount >= goalAmount) {

        status = "Campaign Succeeded";
        ended = true;

        
        require(owner.send(address(this).balance),"Not able to send funds to owner."); 

        return;

    }   

    status = "Campaign Failed";
    ended = true;

    for(uint i = 0; i <= numInvestors; i++) {

        require(Investors[i].addr.send(Investors[i].amount));  

      } 
}

    function kill() public onlyOwner {

        selfdestruct(owner);

    }

}
