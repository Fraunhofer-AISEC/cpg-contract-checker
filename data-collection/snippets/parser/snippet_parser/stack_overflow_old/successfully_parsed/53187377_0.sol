
    pragma solidity ^ 0.4 .23;

    
    contract Geekt {

      address GeektAdmin;

      mapping(bytes32 => notarizedImage) notarizedImages; 
      bytes32[] imagesByNotaryHash; 

      mapping(address => User) Users; 
      address[] usersByAddress; 

      struct notarizedImage {
        string imageURL;
        uint timeStamp;
      }

      struct User {
        string handle;
        bytes32 city;
        bytes32 state;
        bytes32 country;
        bytes32[] myImages;
      }

      constructor() public payable {
        
        GeektAdmin = msg.sender; 
      }

      modifier onlyAdmin() {
        if (msg.sender != GeektAdmin)
          revert("invalid message sender: sender not admin");
        
        _;
      }

      function removeUser(address badUser) public onlyAdmin returns(bool success) {
        delete Users[badUser];
        return true;
      }

      function removeImage(bytes32 badImage) public onlyAdmin returns(bool success) {
        delete notarizedImages[badImage];
        return true;
      }

      function registerNewUser(string handle, bytes32 city, bytes32 state, bytes32 country) public returns(bool success) {
        address thisNewAddress = msg.sender;
        
        if (bytes(Users[msg.sender].handle).length == 0 && bytes(handle).length != 0) {
          Users[thisNewAddress].handle = handle;
          Users[thisNewAddress].city = city;
          Users[thisNewAddress].state = state;
          Users[thisNewAddress].country = country;
          usersByAddress.push(thisNewAddress); 
          return true;
        } else {
          return false; 
        }
      }

      function addImageToUser(string imageURL, bytes32 SHA256notaryHash) public returns(bool success) {
        address thisNewAddress = msg.sender;
        if (bytes(Users[thisNewAddress].handle).length != 0) { 
          if (bytes(imageURL).length != 0) { 
            
            if (bytes(notarizedImages[SHA256notaryHash].imageURL).length == 0) {
              imagesByNotaryHash.push(SHA256notaryHash); 
            }
            notarizedImages[SHA256notaryHash].imageURL = imageURL;
            notarizedImages[SHA256notaryHash].timeStamp = block.number;
            
            Users[thisNewAddress].myImages.push(SHA256notaryHash); 
            return true;
          } else {
            return false; 
          }
          return true;
        } else {
          return false; 
        }
      }

      function getUsers() public view returns(address[]) {
        return usersByAddress;
      }

      function getUser(address userAddress) public view returns(string, bytes32, bytes32, bytes32, bytes32[]) {
        return (Users[userAddress].handle, Users[userAddress].city, Users[userAddress].state, Users[userAddress].country, Users[userAddress].myImages);
      }

      function getAllImages() public view returns(bytes32[]) {
        return imagesByNotaryHash;
      }

      function getUserImages(address userAddress) public view returns(bytes32[]) {
        return Users[userAddress].myImages;
      }

      function getImage(bytes32 SHA256notaryHash) public view returns(string, uint) {
        return (notarizedImages[SHA256notaryHash].imageURL, notarizedImages[SHA256notaryHash].timeStamp);
      }

    }
