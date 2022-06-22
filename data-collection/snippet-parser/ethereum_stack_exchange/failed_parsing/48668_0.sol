
event LogsetFileHash(byte _hashValue);

    function setFileHash(byte hashValue) {
        emit LogsetFileHash(hashValue);
        
    } 
