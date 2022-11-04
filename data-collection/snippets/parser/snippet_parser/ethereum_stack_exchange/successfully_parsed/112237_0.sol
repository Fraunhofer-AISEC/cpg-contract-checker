struct Entity{
    address _address;
    uint data;
}

   Entity[] entityArray;

function addEntityArray(uint _data)  public returns(uint){
    entityArray.push(Entity((msg.sender), _data));
    return entityArray[(entityArray.length) - 1].data;
}
