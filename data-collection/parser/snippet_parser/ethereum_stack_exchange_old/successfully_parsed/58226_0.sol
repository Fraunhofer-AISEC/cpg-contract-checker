function getInsurerEth(string uname) public payable returns(address) {
    for(uint i = 0; i < allOrgs.length; ++ i) {
        if(stringsEqual(allOrgs[i].name, uname)) {
            return allOrgs[i].ethAddress;
        }
    }
}
