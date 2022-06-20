function CheckList(string memory name) public view returns (string memory) {
    for(uint i = 0; i < badNames.length; i++){
        if(badNames[i].badBoy == name){
            return string(abi.encodePacked(name, " is on the naughty list"));
        }
    }
    return string(abi.encodePacked(name, " is not on the naughty list"));
}
