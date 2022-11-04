pragma solidity >=0.4.22 <0.6.0;

import './ERC721Full.sol';
import './Ownable.sol';
import './IERC721Enumerable.sol';
import './IERC721Metadata.sol';
import './ERC721MetadataMintable.sol';
import './SafeMath.sol';
import './IERC20.sol';


contract BullionixGenerator is ERC721Enumerable, ERC721MetadataMintable, Ownable{

    modifier isActive{
    require(isOnline == true);
    _;
    }
using SafeMath for uint256;

IERC20 dgx; 
bool public isOnline = false;
address public DGXContract = address(0x178b11b1a9d8f022987650b7e549DD84A95a1C29); 
uint256 public DGXFees = 0; 
string public name = "Bullionix";
string public title = "";  
string public symbol = ""; 
string public version = "Bullionix v0.1";
string public preURL = "https://bullionix.io/metadata/"; 
mapping(uint256 => uint256) public StakedValue;
mapping(uint256 => seriesData) public seriesToTokenId;
struct seriesData {
                string url;
                uint256 numberInSeries;
                uint256 DGXcost;
                uint256 fee;
        }


constructor() public ERC721Metadata(name, symbol){
        if (address(DGXContract) != address(0x0)) {
            isOnline = true;
            dgx = IERC20(DGXContract);
        }
}


event NewSeriesMade(string indexed url, uint256 indexed numberToMint);
event Staked(address indexed _sender, uint256 indexed _amount, uint256 indexed tokenStaked);
event Burned(address indexed _sender,  uint256 indexed _amount, uint256 indexed _tokenId);
event Withdrawal(address indexed _receiver,  uint256 indexed _amount);



 function toggleOnline() external onlyOwner {
         isOnline = !isOnline;
 }
   
 function createNewSeries(string memory _url, uint256 numberToMint, uint256 DGXcost, uint256 _fee) public onlyOwner isActive returns (bool _success){
      
      require(msg.sender == owner(), 'Only Owner'); 
      uint256 total = totalSupply();
      for(uint i = 0; i < numberToMint; i++){
          seriesToTokenId[total.add(i)].url = _url;
          seriesToTokenId[total.add(i)].numberInSeries = numberToMint;
          seriesToTokenId[total.add(i)].DGXcost = DGXcost;
          seriesToTokenId[total.add(i)].fee = _fee;
      }

   emit NewSeriesMade(_url, numberToMint);
   return true;
 }

 
 function stake(uint256 _tokenToBuy) public payable isActive returns (bool){
      
      require(seriesToTokenId[_tokenToBuy].fee >= 0, "Doesn't Exist yet!");
      uint256  totalCost = seriesToTokenId[_tokenToBuy].DGXcost.add(seriesToTokenId[_tokenToBuy].fee);
      _transferFrom(msg.sender, totalCost);
     string memory fullURL = returnURL(_tokenToBuy);
     require(mintWithTokenURI(msg.sender, _tokenToBuy, fullURL));
     emit Staked(msg.sender, totalCost, _tokenToBuy);
     return true;
 }


  

     
function burn(uint256 tokenId) external {
        
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721Burnable: caller is not owner nor approved");
        _burn(tokenId);
    }

      
function withdrawal() onlyOwner
    public
  returns (bool){
    require(isOnline == false);
    uint256 temp = _checkBalance(); 
    require(dgx.transfer(msg.sender, temp)); 
    emit Withdrawal(msg.sender, temp);
    return true;    
  }
function _checkBalance() internal view returns (uint256){
    uint256 tempBalance = dgx.balanceOf(address(this)); 
   
    return tempBalance;  
}

function viewYourTokens() external view  returns (uint256[] memory _yourTokens){
       return super._tokensOfOwner(msg.sender);
}





  
function returnURL(uint256 _tokenId) internal view returns (string memory _URL){
   require(returnSeriesURL(_tokenId), "ERC721: approved query for nonexistent token"); 
   string memory uri = seriesToTokenId[_tokenId].url;
   return string(abi.encodePacked("https://bullionix.io/metadata", uri)); 
}

  
  function returnSeriesURL(uint256 _tokenId) internal view returns (bool){
      string memory temp = seriesToTokenId[_tokenId].url;
      bytes memory tempEmptyStringTest = bytes(temp);
      require(tempEmptyStringTest.length >= 1, temp);
      return true;
  }
 function _transferFrom (address _owner, uint256 _amount)internal returns (bool)

  {
    require(dgx.transferFrom(_owner, address(this), _amount));
    return true;
  }

function() payable external{
    revert();
}
}
