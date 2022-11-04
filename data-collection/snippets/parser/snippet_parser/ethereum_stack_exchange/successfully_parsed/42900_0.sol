pragma solidity ^0.4.18;

contract MyProjectManger {
  address public owner;
  mapping (uint => MyProject) public myProjects;

  uint projectIndex;
  mapping (uint => uint) public projectFileIndexes;

  struct File {
    string url;
    string fileHash;
  }

  struct MyProject {
    bytes32 id;
    string name;
    mapping (uint => File) projectFiles;
  }

  function MyProjectManger() public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function addProject(bytes32 id, string name) public onlyOwner returns(uint projectId) {
    projectId = projectIndex;    
    myProjects[projectIndex] = MyProject(id, name);
    projectIndex++;
  }

  function addProjectFile(string url, string fileHash, uint projectKey) public onlyOwner returns(uint fileId) {
    uint projectFileIndex = projectFileIndexes[projectKey];
    MyProject storage project = myProjects[projectIndex];    
    require(project.id[0] != 0);

    fileId = projectFileIndex;
    project.projectFiles[projectFileIndex] = File(url, fileHash);    
    projectFileIndex++;
  }

  function remove() onlyOwner public {
      selfdestruct(msg.sender);
  }

  
  function() payable public { }

}
