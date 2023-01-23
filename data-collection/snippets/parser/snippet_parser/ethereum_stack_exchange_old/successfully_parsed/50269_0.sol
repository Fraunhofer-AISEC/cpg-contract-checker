 pragma solidity ^0.4.24;

    
    
    

    contract dappHearts {

        using SafeMath for uint256;

        
        address public contractOwner;
        
        address public lastAddress;

        
        modifier onlyContractOwner {
            require(msg.sender == contractOwner);
            _;
        }

        
        constructor() public {
            contractOwner = msg.sender;
        }

        
        function withdraw() public onlyContractOwner {
            contractOwner.transfer(address(this).balance);
        }

        
        mapping(uint256 => uint256) public totals;

        
        function update(uint256 dapp_id) public payable {
            require(msg.value > 1900000000000000);
            totals[dapp_id] = totals[dapp_id] + msg.value;
            
            lastAddress.transfer(msg.value.div(2));
            lastAddress = msg.sender;
        }

        
        function getTotalHeartsByDappId(uint256 dapp_id) public view returns(uint256) {
            return totals[dapp_id];
        }

        
        function getBalance() public view returns(uint256){
            return address(this).balance;
        }

    }
