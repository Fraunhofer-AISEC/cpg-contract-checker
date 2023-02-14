 struct file {
        string description;
        string hash;
    }

    uint public FileCounts = 0;
    uint public FileId = 0;
    mapping (uint => file) files;
    event _fileCreated(uint indexed id);
    event _fileUpdated(uint indexed id);

    function addFile(string _description, string _hash) public  {
        FileCounts++;
        files[FileId] = file(_description, _hash);
        FileId++;
        emit _fileCreated(FileId);
    }

    function deleteFile(uint id) public restricted {
        delete files[id];
        FileCounts--;
    }

    function getFile(uint id) external constant returns (string, string) {
      file storage F = files[id];

      return (F.description, F.hash);
    }

    function FileCount() public view returns (uint) {
    return FileCounts;
    }


    function getFileDesc(uint id) external constant returns (string) {

      return (files[id].description);
    }
