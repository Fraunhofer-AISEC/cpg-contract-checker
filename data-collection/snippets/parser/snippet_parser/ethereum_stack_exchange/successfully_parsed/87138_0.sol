pragma solidity ^0.5.16;

library EmailRegex {
  struct State {
    bool accepts;
    function (byte) internal pure returns (uint) func;
  }

  function state(uint id) internal pure returns (State memory) {
    if (id == 1) {
      return State(false, s1);
    }
    if (id == 2) {
      return State(false, s2);
    }
}
function matches(string memory input) public pure returns (bool) {
    uint cur = 1;

    for (uint i = 0; i < bytes(input).length; i++) {
      bytes1 c = bytes(input)[i];

      cur = state(cur).func(c);
      if (cur == 0) {
        return false;
      }
    }

    return state(cur).accepts;
  }

  function s1(byte c) internal pure returns (uint) {
    if (c >= 37 && c <= 37 || c >= 43 && c <= 43 || c >= 45 && c <= 45 || c >= 46 && c <= 46 || c >= 48 && c <= 57 || c >= 65 && c <= 90 || c >= 95 && c <= 95 || c >= 97 && c <= 122) {
      return 2;
    }

    return 0;
  }

  function s2(byte c)  internal pure  returns (uint) {
    if (c >= 37 && c <= 37 || c >= 43 && c <= 43 || c >= 45 && c <= 45 || c >= 46 && c <= 46 || c >= 48 && c <= 57 || c >= 65 && c <= 90 || c >= 95 && c <= 95 || c >= 97 && c <= 122) {
      return 3;
    }
    if (c >= 64 && c <= 64) {
      return 4;
    }

    return 0;
  }
}

