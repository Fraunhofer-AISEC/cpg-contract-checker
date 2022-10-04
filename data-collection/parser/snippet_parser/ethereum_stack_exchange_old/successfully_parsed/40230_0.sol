pragma solidity ^0.4.19;
contract Adoption {
  struct Pet {
    address owner;
    uint256 price;

  }

  Pet[16] data;

  function Adoption() public {
    for (uint i = 0; i < 16; i++) {

      data[i].price = 500;
      data[i].owner = msg.sender;
    }
  }


  
  function adopt(uint petId) public payable returns (uint, uint) {
    require(petId >= 0 && petId <= 15);
    if ( data[petId].price == 0 ) {
      data[petId].price = 100;
    } else {
      data[petId].price = data[petId].price * 2;
    }

    require(msg.value >= data[petId].price * uint256(1));
    returnEth(data[petId].owner,  (data[petId].price / 2)); 
    data[petId].owner = msg.sender;
    return (petId, data[petId].price);
    
  }





  function getAdopters() external view returns (address[], uint256[]) {
    address[] memory owners = new address[](16);
    uint256[] memory prices =  new uint256[](16);
    for (uint i=0; i<16; i++) {
      owners[i] = (data[i].owner);
      prices[i] = (data[i].price);
    }
    return (owners,prices);
  }

}
