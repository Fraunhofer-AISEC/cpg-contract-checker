     contract DifferentContract{
        CrowdSale  cscontract;
        function DifferentContract(address crowdsalecontract){
        cscontract = CrowdSale(crowdsalecontract);  
        }

        function GetContributorsFromDifferentContract(address addr) returns (uint)
        {
        return cscontract.GetContributors(addr); 
        }
}
