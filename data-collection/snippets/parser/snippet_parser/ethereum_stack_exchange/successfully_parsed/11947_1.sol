function personFriendCount(address person) constant returns(uint count) {
    return personStructs[person].friends.length;
}
