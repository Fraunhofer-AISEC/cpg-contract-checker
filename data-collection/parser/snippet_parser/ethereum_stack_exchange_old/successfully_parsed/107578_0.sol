library Utils {
   struct UtilType {
      unit var1;
      bool var2;
   }

  function addExtra(UtilType storage state, uint extra) public {
    state.var1 += extra;
  }
}
