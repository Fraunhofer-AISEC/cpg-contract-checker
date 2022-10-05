function oraclizeQuery(string _postId) public payable {
    
    require(oraclize_getPrice("URL") > address(this).balance);

    string memory query = ;
    bytes32 queryId = oraclize_query("URL", query);
    QueryIdToQuery[queryId] = query;
}
