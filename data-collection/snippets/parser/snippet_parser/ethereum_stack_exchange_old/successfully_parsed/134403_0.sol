function newContract(uint[] memory numbers, address[] memory addresses, string[] memory names) 
                    external authorized payable returns (address){
uint256 bnbAmount = msg.value;
uint256 bnbFee = 10 * 10**15;
bnbAmount = bnbAmount.sub(bnbFee);
address _aBot = makeAntiBot();
IBot anti = IBot(_aBot);
emit Creation(_aBot);
address _template = deploy(numbers, addresses, names,_aBot);
emit Creation(_template);
test = _template;
anti.addContract(_template);
liquidAdd(test, 0xE9d39D5b1EEb143FADA974980F17a273Ef8e2209, bnbAmount);


return _template;
}