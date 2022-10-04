function getStats(string _name) public view returns(address,string,bytes32[],uint256[],bytes32){

    bytes32 h = keccak256(abi.encodePacked(_name));

    require(developers_all[h].namehash == h, "A Developer with that name does not exist");

    return (developers_all[h].owner, developers_all[h].name, developers_all[h].skills, developers_all[h].skill_levels, developers_all[h].namehash);
}
