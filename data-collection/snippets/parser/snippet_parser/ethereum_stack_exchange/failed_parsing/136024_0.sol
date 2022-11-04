contract Sample {
  function a() external {
    _b();
  }

  function _b() internal {
    _c();
  }
   
  function _c() internal {
    ...
  }
}
