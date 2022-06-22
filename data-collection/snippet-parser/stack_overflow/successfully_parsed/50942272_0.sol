pragma solidity ^0.4.24;

contract testFactory{
    address[] public deployedFund;

    function createFund(string NewCampaignName) public{
       address newFund = new testFund(NewCampaignName, msg.sender);
       deployedFund.push(newFund);
    }

    function getDeployedFund() public view returns (address[]){
        return deployedFund;
    }
}

contract testFund {    
    struct OurFunders{
        string FristName;
        address ETHaddress;
        uint128 Amount;
        string Email;
        uint8 Funderpercent;
    }

    OurFunders[] public ourFunders;
    address public manager;
    uint8 public Fpercent;
    bool public IsFunded;
    string public CampaignName;    

     constructor (string NewCampaignName, address creater) public{
        manager = creater;
        CampaignName = NewCampaignName;
    }

    function newFunder(string FristName, address ETHaddress, uint128 Amount, string Email, uint8 Funderpercent) public{
        OurFunders memory newPerson = OurFunders({
            FristName: FristName, 
            ETHaddress: ETHaddress, 
            Amount: Amount, 
            Email: Email, 
            Funderpercent: Funderpercent
        });

        Fpercent = Fpercent + Funderpercent;

        if(Fpercent == 100){
            IsFunded = true;
        }

        ourFunders.push(newPerson);
    }
}
