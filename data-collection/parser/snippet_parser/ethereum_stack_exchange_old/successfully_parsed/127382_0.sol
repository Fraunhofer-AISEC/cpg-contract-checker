address[] private tokenList;
mapping(address => uint256) private tokenAmount;
mapping(address => uint256) private lastPosition; 

function withdraw() public {
    uint256 startGas = gasleft();
    uint256 gasUsed;
    
    address token = tokenList[lastPosition[msg.sender]];
    swapTokensForEth(token, tokenAmount[token]);    
    uint256 gasIteration = startGas - gasleft(); 

    while (lastPosition[msg.sender] < tokenList.length && gasleft() > gasIteration ){
        token = tokenList[i];
        swapTokensForEth(token, tokenAmount[token]);    
        lastPosition[msg.sender]++;
        gasUsed = startGas - gasleft();
    }
}
