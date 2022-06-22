function BindingTypeList() public pure returns(string[]  memory) {
   string[] memory names = new string[5];
   names[0] = "DocumentTemplate";
   names[1] = "Definition";
   ...
   names[4] = "Entitlement";
   return names;
}
