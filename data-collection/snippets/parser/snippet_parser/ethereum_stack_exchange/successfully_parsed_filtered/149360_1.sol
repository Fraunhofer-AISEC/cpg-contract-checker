    


pragma solidity 0.8.8;

contract Coin{
    
    holders[] public investors;
    
    mapping(address=>uint256)  public addressToStock;
    mapping(address=>bool)  public addressInvests;

    struct holders{
        address _address;
    }

   

 function deposit(address _address, uint256 _value) public {
    if (addressInvests[_address]==false){
        investors.push(holders(_address));
        addressToStock[_address]=_value;
        addressInvests[_address]=true;
                                        }


      if (addressInvests[_address]==true){
        addressToStock[_address]=addressToStock[_address]+_value;
                                        }
    
    
                                                            }

    function withdraw(address _address, uint256 _value) public {
        addressToStock[_address]=addressToStock[_address]-_value;
        if (addressToStock[_address]==0){
            addressInvests[_address]=false;
        }
    }

    
    function checkBalance(address _address,uint256 _balance) public  returns(bool){
    return addressToStock[_address]<=_balance;

}
}
