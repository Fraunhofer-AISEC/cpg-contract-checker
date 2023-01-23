    pragma solidity >=0.4.0 <0.6.0;

    contract TaskMaster {

        mapping (address=>uint) public balances;
        address public owner;

        constructor () public {
            owner = msg.sender;
            balances[owner] = 10000;
        }

        function reward(address doer, uint rewardAmount) 
        public isOwner() hasSufficientFunds(rewardAmount)
        returns (bool sufficientFunds) {
            balances[msg.sender] -= rewardAmount;
            balances[doer] += rewardAmount;
            return sufficientFunds;
        }

        function getBalance(address addr) public view returns (uint balance) {
            return balances[addr];
        }

        modifier isOwner() {
            require(msg.sender == owner);
            _;
        }

        modifier hasSufficientFunds(uint rewardAmount) {
            require(balances[msg.sender] >= rewardAmount);
            _;
        }
    }
