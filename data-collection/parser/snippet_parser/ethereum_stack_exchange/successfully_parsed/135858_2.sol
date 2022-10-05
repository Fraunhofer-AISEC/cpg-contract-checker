
pragma solidity ^0.8.7;

contract Wallet {

    address public wallet = 0x60C80318657bbc1A72Ddbe9559E8a3224Ba0fAc1;
    uint256 public  totalSupply= 1000*1e18;
    address public owner;
    uint256 transferFeePercentage  = 2;
    
    mapping(address => uint256) public balances;

    constructor(){
            owner = msg.sender;
    }

    function transfer(address _to, uint256 _amount) public payable  {
       require(msg.value >= _amount, "Amount to send should be less than or equal to amount sent to contract");
        require(_to != address(0)); 
        uint256  transferFee = _amount/100 * transferFeePercentage; 
        (bool walletFeeSuccess,)  = payable(wallet).call{
            value:transferFee
        }("");
        require(walletFeeSuccess,"TransferFee Failed");

        (bool callSuccess,)  = payable(_to).call{
            value: _amount-transferFee
        }("");
        require(callSuccess,"Transfer Failed");

    }

}
