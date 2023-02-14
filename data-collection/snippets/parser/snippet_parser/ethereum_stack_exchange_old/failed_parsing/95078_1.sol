import "./Data.sol"
contract Buy {
    Data d = Data(0xddaA.....76a75482d);

    
    function buy(uint prodId, address payable add) payable public  {
        d.updateProduct(prodId, msg.sender);
    }
    
    function getBuyers(uint prodId) public view returns (address payable[] memory) {
        return d.getBuyers(prodId);
    }
}
