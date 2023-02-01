uint256 public value;  
uint256 public feePercent; 
string public itemName;
uint256 public itemId;
address payable public seller;
address payable private feeAddress;  
address private contractDude;  
address private contractFEX;   

event itemForSale(address _seller, string _item, uint256 _id);

constructor (uint256 _value, string memory _itemName, uint256 _itemId, address _dudes, address _erc20, address payable _feeAdd, uint256 _feePercent) {  
    bytes memory temp = bytes(_itemName);
    
    contractDude = _dudes;
    contractFEX = _erc20;
    feeAddress = _feeAdd;  
    feePercent = _feePercent;
    require(mustBeDude(msg.sender), "Seller must be on chain"); 
    itemName = _itemName;
    itemId = _itemId;
    seller = msg.sender;
    value = SafeMath.add(0, _value);
    state = State.ForSale;
    
    emit itemForSale(msg.sender, _itemName, _itemId);   

}

function mustBeDude(address _add) view private returns (bool) {
    DudeOnChain _dudes = DudeOnChain(contractDude);
    return _dudes.isDude(_add);
}
