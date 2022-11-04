
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/introspection/ERC165.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";

contract Parknet is IERC721, ERC165  {

    
 
    
   
    mapping (uint256 => address payable) addressTokenHolder;
    
   
    mapping (uint256 => address payable) addressTokenCreator; 
    
   
    mapping (uint256 => string) tokenname;
    
   
    uint256[] tokens; 
    
    
    function createNewParkspot(uint256 _tokenId, string memory _name) public isUnique(_tokenId){
    require(_tokenId != 0, "Token ID can not be 0");
    
    tokens.push(_tokenId) ;
        
     addressTokenCreator[_tokenId] = msg.sender;
     
     addressTokenHolder[_tokenId] = msg.sender;

     tokenname[_tokenId] = _name;
     
     
     ownertokenCount[msg.sender] = (ownertokenCount[msg.sender] + 1);

     
    }
    
     function getAllIDs() public view returns (uint256[] memory) {
    return tokens;
    }
   
    
    function countParkspots() view public returns (uint) {
        return tokens.length;
    }
    
    function getAddress(uint256 _tokenId) view public returns (address) {
        return (addressTokenHolder[_tokenId]);
    }   
   

    
    function getNamefromTOKENID(uint256 _tokenId) view public returns (string memory) {
    return (tokenname[_tokenId]);
    }
 
 
 
 
 
 
    mapping (uint256 => uint) parkingfee;
    

    function SetParkingFee(uint256 _tokenId, uint _fee) public {

     require (msg.sender == addressTokenCreator[_tokenId]);
  
 require((_exists(_tokenId)), "Token does not exist");   
     

    parkingfee[_tokenId] = _fee/60;
 
    }
    
    
    function GetParkingFee(uint256 _tokenId) view public returns (uint) {
        return (parkingfee[_tokenId]*60);
    }
 
 



mapping (uint256 => uint) parktime;

 
 mapping(address => uint) public balances;

function StartParking (uint256 _tokenId) external payable {
 
 
 
 require((_exists(_tokenId)), "Token does not exist");
 
    if(msg.value < 1000000000000000000){
        require(msg.value < 1000000000000000000, "Deposit of min. 1 ether required");
        revert();
    } 
 
  
  else {  balances[msg.sender] += msg.value;
 
    

     
safeTransferFrom(addressTokenCreator[_tokenId], msg.sender, _tokenId);    
     
    
     parktime[_tokenId] = block.timestamp;
  
    }
}   
    
    
mapping (uint256 => uint) parkingduration;

mapping (uint256 => uint) bill;
  
  
   function EndParking (uint256 _tokenId) public payable{
      
      
         require((_exists(_tokenId)), "Token does not exist");
      
         require (msg.sender == addressTokenHolder[_tokenId]);  
      
       

       
       
       safeTransferFrom(msg.sender, addressTokenCreator[_tokenId], _tokenId); 
       
       
       parkingduration[_tokenId] = block.timestamp - parktime[_tokenId];
       
       bill[_tokenId] = (parkingduration[_tokenId]*parkingfee[_tokenId]);
       
       

      
    if (balances[msg.sender] >= bill[_tokenId]) {
     
     addressTokenCreator[_tokenId].transfer(bill[_tokenId]);
     
     balances[msg.sender] = (balances[msg.sender] - bill[_tokenId]);
     
     msg.sender.transfer(balances[msg.sender]);
    }
    
    else { require(balances[msg.sender] >= bill[_tokenId], "Deposit not sufficient. Use deposit function to refill deposit and end parking again");
        }
      

   } 
    
  

 
 
 
 
 

 
 
    function ShowlastBill (uint256 _tokenId) view public returns (uint) {
        return bill[_tokenId];
    }
 

  function ShowDuration (uint256 _tokenId) view public returns (uint) {
        return parkingduration[_tokenId];
    }
 
 
 
    function ShowDeposit () view public returns (uint) {
        return (balances[msg.sender]);
    } 

 
 function Contractbalance() external view returns (uint){
     return address(this).balance;
 }
 
 
 
 
   function burn(uint256 _tokenId) external {
        
        
        require(msg.sender != address(0));
        require((_exists(_tokenId)), "Token does not exist");
        require (msg.sender == addressTokenCreator[_tokenId], "Only creator can delete token");
        
        delete tokens[_tokenId];
    
    
     ownertokenCount[msg.sender] = (ownertokenCount[msg.sender] - 1);

    }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
 function deposit() external payable {
   
   
    if(msg.value < 1 ether){
        require(msg.value < 1000000000000000000, "Deposit exceeding 1 ether required");
        revert();
    } 
  
  else {  balances[msg.sender] += msg.value;
   
   
 } }
 
 
 function returndeposit() public payable {
     msg.sender.transfer(balances[msg.sender]);
 }
 
 
 
 
 
 


  
    function _exists(uint256 _tokenId) internal view returns (bool) {
        address owner = addressTokenCreator[_tokenId];
        return owner != address(0);
    }
    
    
  
    
    modifier isUnique(uint256 _tokenId) {
        bool result = true;
         
            if (addressTokenCreator[_tokenId] != address(0)) {
            
                result = false;
            }
        
        require(result, "Token with such an ID already exists.");
        _;
    }  
    






 function safeTransferFrom(address from, address payable to, uint256 _tokenId) public {
        require(isApproved(msg.sender));
        
        this.safeTransferFrom(from, to, _tokenId, "");
        addressTokenHolder[_tokenId] = to;
    }



 
    mapping(uint256 => address) tokenApprovals;
    
  function approve(address _to, uint256 _tokenId) external override {
     
        tokenApprovals[_tokenId] = _to;
        emit Approval(msg.sender, _to, _tokenId);
    }



 function isApproved(address spender)
        internal
        view
        returns (bool)
    {
        address owner = msg.sender;
       
        return (spender == owner);
    }


    function getApproved(uint256 _tokenId) override external view returns (address operator)  {
        require(_exists(_tokenId));
        return tokenApprovals[_tokenId];
    }


  
     
      
    mapping(address => mapping(address => bool)) private operatorApprovals;
    
    function setApprovalForAll(address to, bool approved) public override {
        
        operatorApprovals[msg.sender][to] = approved;
        emit ApprovalForAll(msg.sender, to, approved);
    }


    function isApprovedForAll(address owner, address operator) override public view returns (bool)
    {
        return operatorApprovals[owner][operator];
    }









 
    function ownerOf(uint256 _tokenId) override public view returns (address _owner) {
        return (addressTokenHolder[_tokenId]);
    }



   
    mapping(address => uint256) public ownertokenCount;
    
    function balanceOf(address _owner) override public view returns (uint256 _balance) {
        return ownertokenCount[_owner];
    }


    function transferFrom(address _from, address _to, uint256 _tokenId) override public {
   
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) override external {
}   
}
