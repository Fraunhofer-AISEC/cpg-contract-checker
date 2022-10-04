
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
        string memory _attributeToFetch,
        uint _idQuestion,
        address _addressQuorum
    )
    public
    {
        Request storage r = requests.push();
        r.id = currentId;
        r.urlToQuery = _urlToQuery;
        r.attributeToFetch = _attributeToFetch; 
        r.agreedValue = "";
        r.answers[_idQuestion] = "test";
        r.quorum[_addressQuorum] = 0;
    }
}
