struct Funder {
    address addr;
    uint amount;
}

contract FundContract
{
    struct Campaign {
        uint numFunders;
        mapping (uint => Funder) funders;
    }
    mapping (uint => Campaign) campaigns;
       
    function updatestruct(uint campaignID) public
    {
          Campaign storage c = campaigns[campaignID];
         
          c.funders[c.numFunders++] = Funder(msg.sender, 100);  
          
          Funder storage f  = Funder(msg.sender, 100); 
    }

}
