function getDetailsFromSurroundContract(address _contractAddress) public view returns(address, string memory, string memory, string memory, string memory, string memory){
  address wallet_address;
  string userId;
  string first_name;
  string last_name;
  string email_id;
  boolean set;
  string private_key;
  (wallet_address, userId, first_name, last_name, email_id, set, private_key);
  return(wallet_address,userId,first_name,last_name,email_id,private_key);
}
