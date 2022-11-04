import "./ACoin.sol";

Contract B is ERC20{
    Acoin public ACoin;
    Acoin.Staking[] private Staking;
    constructor(string memory name, string memory symbol,address _A) ERC20(name,symbol){
    ACoin = Acoin(_A);
    }
    function GetUserAllStaking() public view returns(Acoin.Staking[] memory){
        return ACoin.SearchStaking();    ---->Here should using msg.sender not Contract B address
    }
}
