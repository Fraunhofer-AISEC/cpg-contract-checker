function getValuesAtIndex(address owner,bytes11 id,uint dataindex) view returns (uint a){

  return (testidmapping[owner][id][dataindex].a);

}

function getDataLength(address owner,bytes11 id)view returns(uint){

  return (testidmapping[owner][id].length);    
}
