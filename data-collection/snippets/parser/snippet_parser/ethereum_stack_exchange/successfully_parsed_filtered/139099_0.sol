    uint contributor_balance = 51.50350 ether;

    uint principal = 21.756 ether;

    uint WAD = 1000000000000000000;

    uint percent_used = contributor_balance * WAD / principal;

    uint contribution = contributor_balance * WAD / percent_used;
    
    return contribution;
