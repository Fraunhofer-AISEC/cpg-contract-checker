  function setListObjects(ContractObject[] memory ContractObjects)public{
    delete objects;
    ContractObject memory newObject;
    for (uint i = 0; i < ContractObjects.length; i++) {
        newObject = ContractObject({
            id:objects.length+1,
            title:ContractObjects[i].title,
            description:ContractObjects[i].description
            });
        objects.push(newObject);
    }
}
