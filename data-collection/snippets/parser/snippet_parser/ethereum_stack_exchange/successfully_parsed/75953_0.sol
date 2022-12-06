 interface ERC20Interface {
     
     function transfer(address _to, uint256 _value)  returns (bool success);
     function transferFrom(address _from, address _to, uint256 _value) 
     returns (bool success);
  }
 interface RegisterInterface {
    function isLogin(address _userAddr) public returns(bool);
 } 

contract RentBasic {
HouseState defaultState = HouseState.ReleaseRent;
struct HouseInfo {          
        uint8    landRate; 
        uint8    ratingIndex;  
        uint8    huxing;     
        string   houseAddress;      
        bytes32  houseId;   
        string   descibe;   
        string   landlordInfo;              
        string   hopeYou;       
        address  landlord;      
}
struct HouseReleaseInfo {
    HouseState    state;  
    uint32        tenancy;
    uint256       rent; 
    uint          releaseTime;  
    uint          updateTime; 
    uint          dealineTime;  
    bool          existed; 
}

ERC20Interface token;
TenancyAgreement tenancyContract;
RegisterInterface userRegister; 

modifier onlyLogin() {
    require(userRegister.isLogin(msg.sender));
    _;
}
function releaseHouse(string _houseAddr,uint8 _huxing,string _describe, string _info, uint32 _tenancy, uint256 _rent, string _hopeYou) public onlyLogin returns (bytes32) {
    uint256 nowTimes = now; 
    uint256 deadTime = nowTimes + 7 days;
    address houseOwer = msg.sender;
    
    
    require(token.transferFrom(houseOwer, receiverPromiseMoney, promiseAmount),"Release_Balance is not enough");
    addrMoney[houseOwer] = promiseAmount;
    bytes32 houseIds = keccak256(abi.encodePacked(houseOwer, nowTimes, deadTime));
    hsInformation = HouseInfo({             
        landRate: 2     
    });
    houseInfos[houseIds] = hsInformation;
    hsReleaseInfos[houseIds] = HouseReleaseInfo({
        state: defaultState
    });
    
    ReleaseBasic(houseIds, 2, _houseAddr, _huxing, _describe, _info, _hopeYou, houseOwer);
    ReleaseInfo(houseIds, defaultState, _tenancy,_rent,nowTimes,deadTime,true);
    return houseIds;
}
}