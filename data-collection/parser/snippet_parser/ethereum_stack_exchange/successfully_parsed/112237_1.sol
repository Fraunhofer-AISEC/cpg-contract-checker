function addEntityArray(uint _data)  public returns(uint){
    Entity storage newEntity = Entity(msg.sender, _data);
    uint entityIndex = entityArray.length;
    entityArray.push(newEntity);
    addressesEntityIndex[msg.sender] = entityIndex;
    return entityArray[entityIndex].data;
}
