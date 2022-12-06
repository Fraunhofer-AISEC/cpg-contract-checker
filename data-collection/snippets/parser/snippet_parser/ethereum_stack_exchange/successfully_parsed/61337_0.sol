contract Post{

struct tags{
bytes32[] tagged; 
}

mapping(address => tags) adminTags;

function appendTags(address addrs, bytes32 tag) public { 
 adminTags[addrs].tagged.push(tag); 
} 

function getTagsofAdmin(address addrs) public view returns(bytes32[]){ 
return adminTags[addrs].tagged; 
}

}
