   function createWhoopy( 
        string memory s_whoopyName,
        uint256 s_num,
    ) public payable restricted {
        whoopyName = s_whoopyName;
        num = s_num;
}
