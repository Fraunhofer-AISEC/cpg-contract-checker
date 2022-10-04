function a(uint _id) {
    uint id_to_delete;
    messageIds.push(_id);
    id_to_delete = messageIds.length - 1;
    
    delete messageIds[id_to_delete];
}
