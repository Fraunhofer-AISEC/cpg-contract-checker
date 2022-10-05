contract Files {
    struct FileDetails {
        string fileHash; 
        string fileName; 
        string transactionDate; 
        string fileExtension; 
    }

    mapping(address => FileDetails[]) filesList;

    function addFile(string memory fileHash, string memory fileName, string memory fileType, string memory date) public {
        FileDetails memory fileDetail = FileDetails({
            fileHash: fileHash,
            fileName: fileName,
            fileExtension: fileType,
            transactionDate: date
        });
        filesList[msg.sender].push(fileDetail);
    }
}
