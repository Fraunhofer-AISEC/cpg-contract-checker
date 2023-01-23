

pragma solidity >=0.6.0 <0.9.0;








struct Funder {

    address addr;    
    uint amount;
    uint distnum;
    uint rank;
}


contract cforig {

    
    
    struct Campaign {
        address payable beneficiary;
        uint fundingGoal;
        uint numFunders;
        uint numMemories;
        uint amount;
        uint votex;
        mapping (uint => Funder) funders;
        mapping (uint =>Omoide) Omoides;
    }
    
    uint numCampaigns;
    mapping (uint => Campaign) campaigns;

    function newCampaign(address payable beneficiary, uint goal) public returns (uint campaignID) {
        campaignID = numCampaigns++; 
        
        
        Campaign storage c = campaigns[campaignID];
        c.beneficiary = beneficiary;
        c.fundingGoal = goal;
        c.votex=10000;
    }

    function contribute(uint campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        
        
        
        
        c.funders[c.numFunders++] = Funder({addr: msg.sender, amount: msg.value, distnum:0, rank:0});
        c.amount += msg.value;
        
        bunpaivotex(campaignID);
        
        

    }


    function checkGoalReached(uint campaignID) public returns (bool reached) {
        Campaign storage c = campaigns[campaignID];
        if (c.amount < c.fundingGoal)
            return false;
        uint amount = c.amount;
        c.amount = 0;
        c.beneficiary.transfer(amount);
        return true;
    }
    
   
    
    function bunpaivotex(uint campaignID) public  {
        Campaign storage c = campaigns[campaignID];
        
       
           
        
        uint amount=c.amount;
        uint votex=c.votex;
        uint funamount=c.funders[0].amount;
        c.funders[0].distnum=(votex/amount)*funamount;
       
    }
    
}