pragma solidity ^0.4.16;
import "browser/AppleToken.sol";

contract EquityInvestments 
{
    AppleToken appleToken;
    Group [] _Groups;
    uint PriceEth = 1;
    address tokenAddress = 0x580156edb25D3c3deD584F1075CcCC5dA4861883;
    mapping (address => mapping(uint=>UserInvestment)) private _UserInvestments;

    function EquityInvestments () public
    {
        _Groups.push(Group({
            GroupID: 1,
            GroupName: "Google",
            TotalInvestment: 0,
            GroupPriceDollars: 200,
            GroupPriceEth: 1
        }));
         _Groups.push(Group({
            GroupID: 2,
            GroupName: "Tesla",
             TotalInvestment: 0,
             GroupPriceDollars: 200,
             GroupPriceEth: 1
        }));
         _Groups.push(Group({
            GroupID: 3,
            GroupName: "Apple",
             TotalInvestment: 0,
             GroupPriceDollars: 200,
             GroupPriceEth: 1
        }));
    }

    struct Group
    {
     uint GroupID;
     string GroupName;
     uint TotalInvestment;
     uint GroupPriceDollars;
     uint GroupPriceEth;
    }

    function sendTokens () public payable returns (uint)
    {
        appleToken = AppleToken(tokenAddress);
        
        
        require(appleToken.transfer(msg.sender, 10));
        return appleToken.balanceOf(msg.sender);
    }



}
