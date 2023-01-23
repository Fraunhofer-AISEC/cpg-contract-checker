
function getPersonDetails(uint id) public constant returns(uint,uint,address){
    return (bidders[id].remainingTokens,bidders[id].personId,bidders[id].addr); 
}
