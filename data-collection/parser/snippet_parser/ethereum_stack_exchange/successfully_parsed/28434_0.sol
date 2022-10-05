 contract CrowdSale {
    mapping (address=>uint) contributors;
    function GetContributors(address addr) returns(uint)
    {
    return contributors[addr];
    }
    }
