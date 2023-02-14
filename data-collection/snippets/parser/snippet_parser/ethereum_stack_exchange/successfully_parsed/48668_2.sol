event LogsetFileHash(bytes32 _hashValue);

function setFileHash(bytes32 _hashValue) {
    emit LogsetFileHash(_hashValue); 
}
