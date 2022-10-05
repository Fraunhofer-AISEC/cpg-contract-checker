contract GovernanceTimeLock is TimelockController {
  ...

  function getDataGrantProposerRole(address account)
    external
    view
    returns (bytes memory)
  {
    return
      abi.encodeWithSelector(
        this.grantRole.selector,
        this.PROPOSER_ROLE,
        account
      );
  }
  function getDataGrantExecutorRole(address account) external view 
    returns (bytes memory) 
  { 
      
  }
