constructor(uint minimum, address creator, string givenTitle, string givenDescription) {
        manager = creator;
        minimumContribution = minimum;
        campaignTitle = givenTitle;
        campaignDescription = givenDescription;
        
    }
