  contract SimpleReturn {
    bool value = false;

    function get() public constant returns (bool) {
      return value;
    }
  }
