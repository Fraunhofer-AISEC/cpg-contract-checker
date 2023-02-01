
function getVoterTokenCount(address voter) returns(uint tokenCount) {
    return voterStructs[voter].tokenIndex.length;}


function getVoterTokenAtIndex(address voter, uint index) returns(bytes32 tokenId) {
    return voterStructs[voter].tokenIndex[index];}


function getVoterTokenUsed(address voter, bytes32 tokenId) returns(uint tokensUsed) {
    return voterStructs[voter].tokensUsed[tokenId];}


function insertVoterToken(address voter, bytes32 tokenId) returns(bool success) {
    voterStructs[voter].tokenIndex.push(tokenId);
    return true;}
