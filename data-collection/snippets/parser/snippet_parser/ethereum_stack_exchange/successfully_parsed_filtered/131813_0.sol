

pragma solidity >0.6.0  <=0.9.0;




contract FundProject {
        
    
    mapping(address => uint256) public addressToAmountFunded;
    
    address[] public funders;
    
    address public owner;
    
   
   constructor() public {
       owner = msg.sender;
   } 

   function fund() public payable {
        
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
   }
   
   function getContractBalance() public view returns (uint) {

       return address(this).balance;    
   }
   function allFunders() public view returns(address  [] memory ) { 

        return funders;
   }
    

    function addyFunded1EthOrMore() public view returns(address  [] memory ) { 
        address[] memory allAddysFunded1EthOrMore;
        uint256 counter = 0;
        for (uint256 i = 0; i <= funders.length; i++) {
            if (addressToAmountFunded[funders[i]] >= 1000000000000000000) {
                allAddysFunded1EthOrMore[counter] = funders[i];
                counter+= 1;
            }
        }
        return allAddysFunded1EthOrMore;
   } 


} 
