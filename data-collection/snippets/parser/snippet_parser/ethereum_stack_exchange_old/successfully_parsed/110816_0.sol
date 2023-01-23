
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

function getUser(address _userAddress,string memory _emailId) public view returns(address,string memory,string memory,string memory,string memory,string memory){
  
   User memory user = users[_userAddress];
   
   
 
   return(users[_userAddress].wallet_address,users[_userAddress].userId,users[_userAddress].first_name,users[_userAddress].last_name,users[_userAddress].email_id,users[_userAddress].private_key);
     
}