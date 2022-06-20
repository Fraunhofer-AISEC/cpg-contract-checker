mapping (address => File[]) database;
mapping (address => uint) public index;

struct File {
    string hashString;
    string date;
    bool isActive;
    uint index;
    uint32 size; 
    string name;   
}
    
function setFile(string memory _hashString, string memory date, uint32 _size, string memory _name) public {
    uint fileIndex = index[msg.sender];
    
    File memory newFile;
    newFile.hashString = _hashString;
    newFile.date = date;
    newFile.isActive = true;
    newFile.index = fileIndex;
    newFile.size = _size;
    newFile.name = _name;
    
    database[msg.sender].push(newFile);
    
    fileIndex ++;
    index[msg.sender] = fileIndex;
}

function getAllFiles() public view returns (File[] memory) {
    File[] memory files = database[msg.sender];
    require(files.length > 0, "There are currently no files");
    
    return files;
}
