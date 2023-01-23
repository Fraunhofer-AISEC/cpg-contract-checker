pragma solidity ^0.8.0;

contract Oracle {
    Request[] requests; 
    uint currentId = 0; 
    uint minQuorum = 2; 
    uint totalOracleCount = 3; 

    struct Request{
        uint id;                            
        string urlToQuery;                  
        string attributeToFetch;            
        string agreedValue;                 
        mapping(uint => string) answers;    
        mapping(address => uint) quorum;    
    }

  
    function createRequest (
        string memory _urlToQuery,
        string memory _attributeToFetch
    )
    public
    {
        uint length = requests.push(Request(currentId, _urlToQuery, _attributeToFetch, ""));  **
        Request storage r = requests[length-1];
    }
}
