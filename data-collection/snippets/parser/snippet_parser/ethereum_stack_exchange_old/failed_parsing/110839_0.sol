pragma solidity >=0.4.22 <0.6.0;

interface IAntboya{
  function createNewUser(address userAcc,string memory _id,string memory firstName,string 
memory lastName,string memory emailId,string memory _private_key) public;
  function getUser(address ,string memory) public view returns(address,string memory,string 
 memory,string memory,string memory,string memory);
 }

 contract CallContract{
function userdetail(address _antboya) public view returns(address,string memory,string 
 memory,string memory,string memory,string memory){
    return IAntboya(_antboya).getUser(address ,string memory);
                                    return IAntboya(_antboya).getUser(address ,string memory);
                                                                                ^-----^
}

}
