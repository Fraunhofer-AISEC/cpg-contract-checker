contract A {
    struct Info {
        string uri;
        uint8 itype;
        int32 attr1;
        int32 attr2;
        int32 attr3;
        int32 attr4;
        int32 attr5;
        int32 attr6;
    }

  function getInfoWithData() public view override returns (uint256[] memory, address[] memory, Info[] memory) {
     
  }
}