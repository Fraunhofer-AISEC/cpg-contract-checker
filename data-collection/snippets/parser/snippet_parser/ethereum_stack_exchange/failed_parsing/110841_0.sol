     

    struct User  {
      
    address  wallet_address;  
    string  userId;
    string  first_name;
    string  last_name;
    
  }
 

  mapping(address => User)  users; 
  mapping(string => address) walletAccount;
  mapping(address => uint) public balanceOf;
  
  
  
  User public newUser ;
 
  uint public length;
  address public owner;
  
  
  constructor() public{
      
      owner = msg.sender;
  }
  
  event userCreated(
      
      address wallet_address,
      string  userId,
      string first_name,
      string last_name,
      
      
  );
  
  function createNewUser(address userAcc,string memory _id,string memory firstName,string memory lastName) public  {


      
     
      
      User storage user = users[userAcc];
      
      
      users[userAcc] = User(userAcc,_id,firstName,lastName); 
      
      
      
      
      
      
     }
     function getUser(address _userAddress,string memory _lastName) public view returns(address,string memory,string memory,string memory){
      
       User memory user = users[_userAddress];
       
       
      
       return(users[_userAddress].wallet_address,users[_userAddress].userId,users[_userAddress].first_name,users[_userAddress].last_name);
         
  }
