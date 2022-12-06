pragma solidity ^0.4.17;

contract web2decentorage {
    address public decentorage;
    address public webUser;
    address[] public storageNodes;
    uint userValue;  
    uint storageNodeValue;
    
    function web2decentorage(uint UV, uint SNV) public {
        userValue = UV;
        storageNodeValue = SNV;
        decentorage = msg.sender;   
    }
    
    function getPaidByUser() public payable {
        require(msg.value > userValue);    
        webUser = msg.sender;           
    }
    
    function addStorageNode(address A) public restricted {
        storageNodes.push(A);
    } 
    
    function payStorageNode(address A) public restricted {
        for(uint i=0; i<storageNodes.length; i++){
            if(storageNodes[i] == A){
                storageNodes[i].transfer(storageNodeValue);   
            }
        }
    }

    function getStorageNodes() public restricted returns(address[]) {
      return storageNodes;
    }

    function getDecentorage() public restricted view returns(address) {
      return decentorage;
    }

    function getwebUser() public restricted view returns(address) {
      return webUser;
    }
    
    modifier restricted() {
        require(msg.sender == decentorage);
        _;
    }
}
