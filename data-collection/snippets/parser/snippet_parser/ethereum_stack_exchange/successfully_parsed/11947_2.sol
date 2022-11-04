function personFriendAtIndex(address person, uint index) constant returns(address friendAddress) {
    return personStructs[person].friends[index];
}
