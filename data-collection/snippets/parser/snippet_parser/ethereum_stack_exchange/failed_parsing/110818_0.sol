contract Othersurround {

 function getDetailsFromSurroundContract(address _contractAddress)public view returns(address,string memory,string memory,string memory,string memory,string memory){
   
  surround other = surround(_contractAddress);
                                         surround other = surround(_contractAddress);***
                                         ^-------^ 
    address  wallet_address = other.getUser();  
    string  userId = other.getUser();
    string  first_name = other.getUser();
    string  last_name = other.getUser();
    string  email_id = other.getUser();
    bool set = other.getUser();
    string private_key = other.getUser();
    
    return(wallet_address,userId,first_name,last_name,email_id,private_key);
    
 }
}
