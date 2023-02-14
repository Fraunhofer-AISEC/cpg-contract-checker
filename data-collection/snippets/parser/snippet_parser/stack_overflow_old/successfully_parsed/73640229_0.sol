contract SendMoney{

        mapping(address => uint) balance;


        receive() external payable {
                    SendedMoney(msg.sender, msg.value);
                }


       function SendedMoney(address _senderaddress, uint _amount){
        balance[_senderaddress] = _amount;
        }
}
