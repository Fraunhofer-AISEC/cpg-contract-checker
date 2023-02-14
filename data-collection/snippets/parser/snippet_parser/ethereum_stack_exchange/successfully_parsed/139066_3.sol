
pragma solidity >=0.4.25 <0.9.0;

contract HelloBlockchain {
    struct token {
        address token;
        uint256 balance;
    }

    function getBalances(address walletAddress, address[] memory tokenAddress) public returns(token[] memory){
        
        
        token[] memory res = new token[](tokenAddress.length); 

        for (uint i = 0; i < tokenAddress.length; i++) {
        (bool success, bytes memory data) = address(tokenAddress[i]).call(abi.encodeWithSignature("balanceOf(address)", walletAddress));
        if (success) {
            uint256 amount = abi.decode(data, (uint256));
            res[i]= token(tokenAddress[i], amount);
            }
        }
        return res;
    }
}
