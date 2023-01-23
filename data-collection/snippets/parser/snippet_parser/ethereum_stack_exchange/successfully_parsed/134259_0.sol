contract C {
  struct Info {
    uint x;
    string y;
  }

  uint[] keys;
  mapping (uint => Info) public keyToInfo;
  mapping (address => uint[]) userToKeyList;
 
  function getAllInfo() public view returns (Info[] memory allInfo) {
    allInfo = new Info[](keys.length);
    for (uint i = 0; i < allInfo.length; ++i) {
      allInfo[i] = keyToInfo[keys[i]];
    }
  }

  function getInfoOf(address _user) public view returns (Info[] memory allInfo) {
    allInfo = new Info[](userToKeyList[_user].length);
    for (uint i = 0; i < allInfo.length; ++i) {
      allInfo[i] = keyToInfo[userToKeyList[_user][i]];
    }
  }
}
