

interface KyberNetworkProxyInterface {
    function maxGasPrice() public view returns(uint);
    function getUserCapInWei(address user) public view returns(uint);
    function getUserCapInTokenWei(address user, ERC20 token) public view returns(uint);
    function enabled() public view returns(bool);
    function info(bytes32 id) public view returns(uint);

    function getExpectedRate(ERC20 src, ERC20 dest, uint srcQty) public view
        returns (uint expectedRate, uint slippageRate);

    function tradeWithHint(ERC20 src, uint srcAmount, ERC20 dest, address destAddress, uint maxDestAmount,
        uint minConversionRate, address walletId, bytes memory hint) public payable returns(uint);

    function swapEtherToToken(ERC20 token, uint minRate) public payable returns (uint);

    function swapTokenToEther(ERC20 token, uint tokenQty, uint minRate) public returns (uint);


}
contract Playground {

    address public daiAddress = 0x6b175474e89094c44da98b954eedeac495271d0f;
    address public kyberAddress = 0x818E6FECD516Ecc3849DAf6845e3EC868087B755;
    address private ETH_ADDRESS = 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee; 
    address public UniDaiAddress = 0x2a1530C4C41db0B0b2bB646CB5Eb1A67b7158667;

    constructor(){

    }

    function etherToDai(uint256 quantity) payable returns (uint256) { 
        KyberNetworkProxyInterface KNPI = KyberNetworkProxyInterface(daiAddress);
        uint256 expectedRate;
        uint256 slippageRate;
        ERC20 daiToken = ERC20(daiAddress);
        (expectedRate, slippageRate) = KNPI.getExpectedRate(ERC20(ETH_ADDRESS), daiToken, quantity);
        uint256 received = KNPI.swapEtherToToken.value(quantity)(ERC20(daiAddress), slippageRate);
        require(daiToken.transfer(msg.sender, received));
        return received;
    }

    function () external payable  {

    }
}
