    pragma solidity ^0.4.19

    contract EtherStore {

        
        uint256 public withdrawalLimit = 1 ether;

        mapping(address => uint256) public lastWithdrawTime;
        mapping(address => uint256) public balances;

        function depositFunds() public payable {
            balances[msg.sender] += msg.value;
            }

        function withdrawFunds (uint256 _weiToWithdraw) public {

            ...
            ...
        }  
    }
