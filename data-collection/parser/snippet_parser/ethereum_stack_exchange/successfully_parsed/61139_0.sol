contract FileList {

   
   struct File {
      uint256 id;
      string ipfshash;
      bytes32 filename;
      bytes32[5] tags;
      address owner;
      uint256 timestamp;
   }
   uint256 public constant maxAmountOfFiles = 1000;
   
   mapping(address => File[maxAmountOfFiles]) public files;
   
   mapping(address => uint256) public lastIds;
   

   
   
   
   function getFileTags(address owner, uint256 _index) external view returns (bytes32[5]) {
       return files[owner][_index].tags;
  }

}
