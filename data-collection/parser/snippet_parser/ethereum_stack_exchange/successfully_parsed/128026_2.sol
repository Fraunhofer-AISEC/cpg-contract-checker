pragma solidity ^0.8.13;

import {Myevents} from "./libraries/Myevents.sol";

contract Users {

  function createUser(address _user, uint256 _duration) {

      
      emit Myevents.CreateUser(_user, _duration);

   }
}
