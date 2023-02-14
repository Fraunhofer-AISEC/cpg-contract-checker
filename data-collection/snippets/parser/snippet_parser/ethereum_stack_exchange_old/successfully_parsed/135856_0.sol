function factoryReceiveRawMaterials(uint256 _supplyChainId, address _warehouse) public{
    FactoryDetail[] memory fd =IdToFactory[_supplyChainId];
    for(uint i=0; i<fd.length; i++){
        if(fd[i].factory==msg.sender && fd[i].itemState== State.factoryBuyRawMaterial ){
            fd[i].warehouse =_warehouse;
            fd[i].itemState =State.factoryReceiveRawMaterials;
            fd[i].timeStamp1 =block.timestamp;
            temp=true;
            return;
        }
    }
}
