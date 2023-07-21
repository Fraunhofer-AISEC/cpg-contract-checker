
pragma solidity 0.8.8;

contract faya{
    
    holders[] public investors;
    
    mapping(address=>uint256)  public addressToStock;
    mapping(address=>bool)  public addressinvests;

    struct holders{
        address _address;
    }

   

 function deposit(address _address, uint256 _value) public {
    if (addressinvests(_address)==false){
        investors.push(holders(_address));
        addressToStock[_address]=_value;
                                        }


      if (addressinvests(_address)==true){
        addressToStock[_address]=addressToStock[_address]+_value;
                                        }
    
    
                                                            }

    function withdraw(address _address, uint256 _value) public {
        addressToStock[_address]=addressToStock[_address]-_value;
        investors[_address]-=_value;
    }}
