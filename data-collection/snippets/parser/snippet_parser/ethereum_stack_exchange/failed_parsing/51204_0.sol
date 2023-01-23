struct Feature {
    int128 key;
    uint256 goal;
    bool finishOnGoal;
    uint campaignStart; 
    uint campaignFinish; 

    PledgeType pledgeType; 
    FixedPledge fixedPledge; 
    VariablePledge variablePledge; 

    PrepaymentType prepaymentType; 
    FixedPrepayment fixedPrepayment; 
    PercentPrepayment percentPrepayment; 

    uint16 maxDevelopmentDelay; 
    uint16 developmentDuration; 

    ConfirmationType confirmationType; 
    UserConfirmation userConfirmation; 

    address developer;
}

...


mapping (int128 => Feature) features;


mapping (int128 => FeatureData) data;

...


function addFeature(
    int128 key,
    uint256 goal,
    bool finishOnGoal,
    uint campaignStart,  
    uint campaignFinish, 
    uint16 maxDevelopmentDelay,
    uint16 developmentDuration,
    address developer) public
    ownerOnly
    withState(key, State.NotSet)
{
    Feature memory feature;
    feature.key = key;
    feature.goal = goal;
    feature.finishOnGoal = finishOnGoal;
    feature.campaignStart = campaignStart;
    feature.campaignFinish = campaignFinish;
    feature.maxDevelopmentDelay = maxDevelopmentDelay;
    feature.developmentDuration = developmentDuration;
    feature.developer = developer;

    FeatureData memory featureData;
    featureData.state = State.Deployment;
    featureData.backers = new address[](0);
    featureData.raised = 0;
    featureData.prepaid = 0;

    features[key] = feature;
    data[key] = featureData;
}
