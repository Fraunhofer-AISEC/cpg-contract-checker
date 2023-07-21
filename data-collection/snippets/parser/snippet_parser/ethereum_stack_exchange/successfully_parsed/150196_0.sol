pragma solidity ^0.8.18;



import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract UMFS {

address ADMIN;
 

struct FEEDATA {
    string Name ; 
    uint256 reg_ID;
    uint256 FeeAmount;
    bool Paid ;
}
 
mapping(uint256 => FEEDATA) StudentDATA;
 

 constructor () {
      ADMIN = msg.sender;
 }

function SetStudentData( uint256 _reg_ID , string memory _name,uint256 _FeeAmount ) public {
       StudentDATA[_reg_ID].Name = _name;
       StudentDATA[_reg_ID].reg_ID = _reg_ID;
       StudentDATA[_reg_ID].FeeAmount = _FeeAmount ;
       StudentDATA[_reg_ID].Paid = false;
}

function SET_NE_ADMIN(address _Admin) public OnlyAdmin {
    ADMIN = _Admin;
}


function GET_FEE_STATUS (uint256 _reg_ID) public view  returns(bool value) {
     require(StudentDATA[_reg_ID].reg_ID == _reg_ID,"NOT STU");
       return StudentDATA[_reg_ID].Paid;
}

function getFee(uint256 _reg_ID) public  view returns(uint256){
     require(StudentDATA[_reg_ID].reg_ID == _reg_ID,"NOT STU");
    return getConverstionRate(StudentDATA[_reg_ID].FeeAmount);
    
}

function GetPay(uint256 _reg_ID) public payable{
    require(StudentDATA[_reg_ID].reg_ID == _reg_ID,"NOT STU");
    require(StudentDATA[_reg_ID].Paid == false ,"Alread Paid!");
    require(getConverstionRate(msg.value) >= StudentDATA[_reg_ID].FeeAmount , "not engh");
    
      (bool success, ) = payable(msg.sender).call{
            value:  StudentDATA[_reg_ID].FeeAmount
        }("");
      require(success);
    StudentDATA[_reg_ID]. Paid = true;


}

 function getpriceETH() public view returns(uint256){
       AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       (,int256 answer,,,) = pricefeed.latestRoundData();
       return uint256(answer * 1e10);
    }

   function getConverstionRate(uint256 _EthAmount) internal view returns(uint256) {
        uint256 ethAmount = getpriceETH();
        uint256 ethAmountInUSD = (ethAmount * _EthAmount) / 1e18;
        return ethAmountInUSD;
    }

modifier OnlyAdmin {
    require(msg.sender == ADMIN , "NOT ADMIN!");
    _;
}
}