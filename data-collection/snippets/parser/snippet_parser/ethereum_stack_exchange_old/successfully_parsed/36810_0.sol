    pragma solidity ^0.4.18;

    contract DataStore {

        address public creator;
        address UbiAccount = 0x627306090abaB3A6e1400e9345bC60c78a8BEf57;  


        event Transfer(address indexed _from, address indexed _to, uint256 _value);
        event LogFundsReceived(address sender, uint amount);
        event LogFundsSent(address receiver, uint amount);

        function() payable public {
            LogFundsReceived(msg.sender, msg.value);
        }

        function DataStore() payable public {
            creator = msg.sender;
            LogFundsReceived(msg.sender, msg.value);
        }

        function kill() public {
            selfdestruct(creator);
        }

        function SendPaymentToContract() public payable returns(bool sufficient) {
            getCurrentAddress().transfer(msg.value);
            LogFundsSent(UbiAccount, msg.value);

            return true;
        }

        function SendPaymentToUbi() public payable returns(bool sufficient) {
            UbiAccount.transfer(msg.value);
            LogFundsSent(UbiAccount, msg.value);

            return true;
        }

        function getCurrentAddress() public view returns (address){
          return this;
        }
    }
