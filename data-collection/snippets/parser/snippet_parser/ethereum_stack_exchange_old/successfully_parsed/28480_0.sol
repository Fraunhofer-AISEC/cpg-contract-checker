function init() {
    require(! isInitialized);
    isInitialized = true;

    bytes32[] storage votableGroups;
    bytes32 fullTimeHash = keccak256('full_time');
    votableGroups.push(fullTimeHash);

    
    votingTypeList.push(VotingType({
        name: "Default",
        description: "For initializing",
        quorumPercent: 100,
        minForPercent: 100,
        activeTimeInBlocks: 25,
        goodRepWeight: 1,
        badRepWeight: 1,
        votableGroups: votableGroups
    }));
    votingTypeList[votingTypeList.length - 1].isEligible[fullTimeHash] = true;
}
