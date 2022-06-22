function BindingTypeList() public pure returns(string[] memory) {
    string[] memory arr = new string[](5); 
    arr[0] = "DocumentTemplate";
    arr[1] = "Definition";
    arr[2] = "RepAndWarranty";
    arr[3] = "Restriction";
    arr[4] = "Entitlement";
    
    return arr;
}
