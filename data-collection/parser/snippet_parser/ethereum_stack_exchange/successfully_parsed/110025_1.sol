pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./StateMachine.sol";


contract SupplyChain is StateMachine, Initializable {
  bytes32 public constant STATE_DEMAND_GENERATED = 'DEMAND GENERATED';

  bytes32 public constant ROLE_ADMIN = 'ROLE_ADMIN';

  bytes32[] public _roles = [ROLE_ADMIN];

  
  function initialize() public virtual initializer {
    address Admin = msg.sender;
    _setupRole(DEFAULT_ADMIN_ROLE, Admin);
    _setRoleAdmin(ROLE_ADMIN, DEFAULT_ADMIN_ROLE);
    setupStateMachine(Admin);
    }


  function setupStateMachine(address Admin) internal override {
    

    createState(STATE_DEMAND_GENERATED);
    

    setInitialState(STATE_DEMAND_GENERATED);
  }
}
