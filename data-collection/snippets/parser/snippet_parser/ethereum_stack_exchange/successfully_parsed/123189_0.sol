

pragma solidity >=0.6.0 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";




contract FundMe {
     

    mapping(address =>uint256) public AddressFunding;
    address [] public funders;
    address public owner;
    constructor () public 
    {
       owner=msg.sender;
    }
    
    
    function fund() public payable{
         uint256 min= 0* 10** 8;
         require(ConvertUsd(msg.value)>= min, "not enough eth");
         AddressFunding[msg.sender] += msg.value ;
         funders.push(msg.sender);
         
    }

    modifier onlyOwner{
      require(msg.sender== owner);
      _;
    }

     function Withdraw() payable onlyOwner public{
       
       payable(msg.sender).transfer(address(this).balance);
       for(uint i=0;i<funders.length;i++)
       {
         AddressFunding[funders[i]]=0;
       }
       funders =new address[](0);
     }

    AggregatorV3Interface priceFeed= AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    
    function  getValue() public view returns(int256){
    (, int256  answer,,,)=priceFeed.latestRoundData();
    return answer;}

    function ConvertUsd(uint256 eth) public view returns(uint256)
    {
        uint256 dollar=uint256(getValue());
        uint256 amt= (dollar*eth)/1000000000000000000;
        return amt;
    } 
    
    address  [] public  uniqueFunders;
    function TotalMoney() public  returns(uint256){
      uniqueFunders=new address[](0);
      funders[0] == uniqueFunders[0];
      uint256 size=1;
      uint256 total =0+AddressFunding[uniqueFunders[0]];
      for(uint256 i=1;i<funders.length;i++)
      {
        
        int flag=0;
        for(uint256 j=0;j<uniqueFunders.length;j++)
        {
          if(funders[i] == uniqueFunders[j]){
          flag++;
          break;
          }
          
        }
        if (flag == 0){
        uniqueFunders[size]=funders[i];
        total=total+AddressFunding[uniqueFunders[size]];
        size++;
        }
      }
      return total;
    }


    
    }
