Contract Acoin is ERC20{
    struct Staking {
    uint256 Coin;
    uint256 ArriveCoin;
    uint256 ArriveTime;
    uint256 Time;
    uint256 State; 
    }
    mapping(address => Staking[]) public All_Staking;
    constructor(string memory name, string memory symbol) ERC20(name,symbol){}
    function SearchStaking() public view returns (Staking[] memory) {
        require(All_Staking[msg.sender].length > 0,"Sorry, This account does not have any Token staking");
        return All_Staking[msg.sender];
    }
}
