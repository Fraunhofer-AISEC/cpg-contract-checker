contract MyGovernor is Governor, GovernorSettings, GovernorCountingSimple, GovernorVotes, GovernorVotesQuorumFraction {
    constructor(IVotes _token)
        Governor("MyGovernor")
        GovernorSettings(1, 1, 0)
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)
    {}
...
}
