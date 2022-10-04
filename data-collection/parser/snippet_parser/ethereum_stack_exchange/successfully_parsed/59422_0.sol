function storevalues(address owner,bytes11 id,uint a,uint b) public{
testidmapping[owner][id].push(data(a,b));
}

function getvalues(address owner,bytes11 id) view returns (uint a){
  data storage k = testidmapping[owner][id];
  return (k.a);

}
