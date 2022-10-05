pragma solidity ^0.4.18;

contract CrowdFunding {

    struct Investor {

        address addr;

        uint amount;

    }

    address public owner;

    uint public numInvestors;

    uint public deadline;

    string public status;

    bool public ended;

    uint public goalAmount;

    uint public totalAmount;

    mapping (uint => Investor) public Investors;

    modifier onlyOwner () {

        require(msg.sender == owner);

        _;

    }

    constructor(uint _duration, uint _goalAmount) public {

        owner = msg.sender;

        deadline = now + _duration;

        goalAmount = _goalAmount;

        status = "Funding";

        ended = false;

        numInvestors = 0;

        totalAmount = 0;

    }

    function fund() public payable {

        require(!ended);

        Investor storage inv = Investors[numInvestors++];

        inv.addr = msg.sender;

        inv.amount = msg.value;

        totalAmount += inv.amount;

    }


function checkGoalReached () public onlyOwner {

        require(!ended);

        require(now >= deadline);

        if(totalAmount >= goalAmount) {

        status = "Campaign Succeeded";

        ended = true;

        require(!owner.send(address(this).balance));

        uint i = 0;

        status = "Campaign Failed";

        ended = true;

        while(i <= numInvestors) {

            require(!Investors[i].addr.send(Investors[i].amount));

            i++;

          } 

  }

    }

    function kill() public onlyOwner {

        selfdestruct(owner);

    }

}
