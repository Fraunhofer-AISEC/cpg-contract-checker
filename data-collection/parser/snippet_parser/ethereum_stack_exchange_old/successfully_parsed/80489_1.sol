function updateDoc(uint _id, string memory _IPFShash, string memory _title) public {
    if (Docs[_id].id == _id) {
        Docs[_id].content  = _IPFShash;

        
        emit DocUploaded(_id,  _title, _IPFShash, msg.sender);
    }
}
