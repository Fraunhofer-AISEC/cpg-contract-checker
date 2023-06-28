pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";


abstract contract StateMachine is AccessControl {
  event Transition(address sender, bytes32 fromState, bytes32 toState);

  struct State {
    
    bool hasBeenCreated;
    
    mapping(bytes4 => bool) allowedFunctions;
    
    bytes32[] allowedRoles;
    
    function(bytes32, bytes32) internal view[] preConditions;
    
    function(bytes32, bytes32) internal[] callbacks;
    
    bytes32[] nextStates;
    
    bytes4 preFunction;
  }

  struct StateTransition {
    bytes32 fromState;
    bytes32 toState;
    address actor;
    uint256 timestamp;
  }
  

  StateTransition[] public history;

  mapping(bytes32 => State) internal states;
  bytes32[] internal possibleStates;
  bytes32 internal currentState;

  
  bytes4[] internal knownSelectors;
  mapping(bytes4 => bool) internal knownSelector;

  
  bytes4[] internal stateFunctions;
  mapping(bytes32 => bytes4[]) internal stateFunction;

  
  mapping(bytes32 => mapping(bytes32 => bool)) internal nextStateToState;
  
  
  
  function setupStateMachine(address Admin) internal virtual {}

  function createState(bytes32 stateName) internal {
    require(!states[stateName].hasBeenCreated, "this state has already been created");
    states[stateName].hasBeenCreated = true;
    possibleStates.push(stateName);
  }


  
  function setInitialState(bytes32 initialState) internal {
    require(states[initialState].hasBeenCreated, "the initial state has not been created yet");
    require(
      currentState == 0,
      "the current state has already been set, so you cannot configure the initial state and override it"
    );
    currentState = initialState;
  }
}
