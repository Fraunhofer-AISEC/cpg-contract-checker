contract CrowdFunding {
    struct Funder {
        address addr;
        uint amount;
    }

    struct Campaign {
        address beneficiary;
        uint numFunders;
        uint amount;
        mapping (uint => Funder) funders;
    }

    uint numCampaigns;
    Campaign[] public campaigns;

    function newCampaign() public returns (uint campaignID) {
        campaignID = campaigns.length++;
        Campaign storage c = campaigns[campaignID];
        c.beneficiary = msg.sender;
    }

    function contribute(uint _campaignID, uint _amount) public {
        Campaign storage c = campaigns[_campaignID];
        c.funders[c.numFunders++] = Funder({addr: msg.sender, amount: _amount});
        c.amount += 100;
    }

    
    function getFundsByAddress() public view returns (uint[] memory) {
        Campaign storage c = campaigns[0];
        uint cont = c.numFunders;

        uint[] memory allAmount = new uint[](TotalAmountOfUser);

        uint counter = 0;

        for (uint i=0; i < cont; i++) {
           if (c.funders[counter].addr == msg.sender) {
               allAmount[amountCont] = c.funders[counter].amount;
           }
           counter++;
        }

        return allAmount;
    }   
}
