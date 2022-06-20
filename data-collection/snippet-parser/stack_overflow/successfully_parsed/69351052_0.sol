  struct User  {
      
    address  wallet_address;  
    string  userId;
    string  first_name;
    string  last_name;
    string  email_id;
    bool set;
    string private_key;

  }
 

  mapping(address => User)  users; 
  mapping(string => address) walletAccount;
  mapping(address => uint) public balanceOf;
  User[] public registeredArray;
  
  
  User public newUser ;
 
  uint public length;
  address public owner;
  
  
  constructor() public{
      
      owner = msg.sender;
  }
  
 

 

  function createNewUser(address userAcc,string memory _id,string memory firstName,string memory lastName,string memory emailId,string memory _private_key) public  {


      
     
      
      User storage user = users[userAcc];
      
      
     
     users[userAcc] = User(userAcc,_id,firstName,lastName,emailId,true,_private_key); 
      
      walletAccount[emailId] = userAcc;
      
       registeredArray.push(userAcc);
     
  }


 
  
 
  
  function getUser(address _userAddress,string memory _emailId) public view returns(address,string memory,string memory,string memory,string memory,string memory){
      
       User memory user = users[_userAddress];
       
       
      
        
       return(users[_userAddress].wallet_address,users[_userAddress].userId,users[_userAddress].first_name,users[_userAddress].last_name,users[_userAddress].email_id,users[_userAddress].private_key);
         
  }
  
  
   
    function Listofuser()public view returns(address[] memory){ registeredArray.push(userAcc);
return registeredArray;
}