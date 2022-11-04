
pragma solidity ^0.8.11;
import "./NFTMarket.sol";  

contract NFTCounter {
    address private _contractOwner;   
    mapping(uint256 => address) public IndContract;       
    NFTMarket public _NFTMarket;                   
    uint256 public AddCounter;                     


    constructor(){
        _contractOwner = msg.sender;
        AddCounter = 0;
    }
    modifier onlyContractAdmin() {
        require(msg.sender == _contractOwner, "Only the contract owner can do this 
action.");
        _;
    }
    function addIndContract(uint256 Ind_Contract ,address NFT_addr) public {
        IndContract[Ind_Contract] = NFT_addr;
        AddCounter++;
    }
    function mintTo(uint256 Ind_Contract , address to , uint256 Ind_mint) public 
onlyContractAdmin returns(bool){
        NFTMarket contract_ = NFTMarket(IndContract[Ind_Contract]);
        contract_.mint(Ind_mint,to);
        return true;
    }
}
