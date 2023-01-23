   
    contract Wallet {

        
        event PreExecute(address to, uint value, uint gas);
        event Execute(address to, uint value, uint balanceAfter, uint spentGas);
        event ExceededExecuteWithValue(address to, uint value);
        event FailedExecute(address to, uint value, uint balanceAfter);

        
        
        address owner;

        function Wallet() {
            
            
            owner = msg.sender;
        }

        
        function execute(address _to, uint _value, uint _gas, bytes _data) external {

            uint balanceBefore;
            uint balanceAfter;
            bool success;

            if(msg.sender != owner) {
                throw;
            }

            if(_value > this.balance) {
                ExceededExecuteWithValue(_to, _value);
                return;
            }

            balanceBefore = this.balance;

            
            if(_value > 0) {
                success = _to.call.value(_value)(_data);
            } else {
                success = _to.call(_data);
            }

            balanceAfter = this.balance;

            if(success) {
                Execute(_to, _value, balanceAfter, (balanceBefore - balanceAfter) - _value);
            } else {
                FailedExecute(_to, _value, balanceAfter);
            }
        }

        
        function() {
            
            if (msg.value > 0) {
                Deposit(msg.sender, msg.value);
            }
        }

    }
