address[] private investorsList;

function invest() public payable {
  require(msg.value == 0.1 ether);
  investorsList.push(msg.sender); 
}

function withdraw() public {
  for (uint i = 0; i < investorsList.length; i++){  
    if (address(this).balance > 1 ether){           
      investorsList[i].transfer( 0.5 ether);        
    }
  }
}
