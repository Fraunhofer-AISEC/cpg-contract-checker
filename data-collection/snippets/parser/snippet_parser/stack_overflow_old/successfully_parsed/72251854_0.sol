
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorSettings.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorTimelockControl.sol";

contract GovernernerContract is Governor, GovernorSettings, GovernorCountingSimple, 
GovernorVotes, GovernorVotesQuorumFraction, GovernorTimelockControl {
constructor(
                            IVotes _token, 
                            TimelockController _timelock, 
                            uint256 _votingDelay,
                            uint256 _votingPeriod,
                            uint256 _quorumPercentage
                        )
    Governor("governernerContract")
    GovernorSettings( _votingDelay , _votingPeriod  , 0)
    GovernorVotes(_token)
    GovernorVotesQuorumFraction(_quorumPercentage)
    GovernorTimelockControl(_timelock)
{}
    





function _countVote(
    uint256 proposalId,
    address account,
    uint8 support,
    uint256 weight,
    bytes memory 
) internal override {

}


function votingDelay()
    public
    view
    override(IGovernor, GovernorSettings)
    returns (uint256)
{
    
}

function votingPeriod()
    public
    view
    override(IGovernor, GovernorSettings)
    returns (uint256)
{
    return super.votingPeriod();
}

function quorum(uint256 blockNumber)
    public
    view
    override(IGovernor, GovernorVotesQuorumFraction)
    returns (uint256)
{
    return super.quorum(blockNumber);
}

function state(uint256 proposalId)
    public
    view
    override(Governor, GovernorTimelockControl)
    returns (ProposalState)
{
    return super.state(proposalId);
}

function propose(address[] memory targets, uint256[] memory values, bytes[] memory calldatas, string memory description)
    public
    override(Governor, IGovernor)
    returns (uint256)
{
    return super.propose(targets, values, calldatas, description);
}

function proposalThreshold()
    public
    view
    override(Governor, GovernorSettings)
    returns (uint256)
{
    return super.proposalThreshold();
}

function _execute(uint256 proposalId, address[] memory targets, uint256[] memory values, bytes[] memory calldatas, bytes32 descriptionHash)
    internal
    override(Governor, GovernorTimelockControl)
{
    super._execute(proposalId, targets, values, calldatas, descriptionHash);
}

function _cancel(address[] memory targets, uint256[] memory values, bytes[] memory calldatas, bytes32 descriptionHash)
    internal
    override(Governor, GovernorTimelockControl)
    returns (uint256)
{
    return super._cancel(targets, values, calldatas, descriptionHash);
}

function _executor()
    internal
    view
    override(Governor, GovernorTimelockControl)
    returns (address)
{
    return super._executor();
}

function supportsInterface(bytes4 interfaceId)
    public
    view
    override(Governor, GovernorTimelockControl)
    returns (bool)
{
    return super.supportsInterface(interfaceId);
}
}