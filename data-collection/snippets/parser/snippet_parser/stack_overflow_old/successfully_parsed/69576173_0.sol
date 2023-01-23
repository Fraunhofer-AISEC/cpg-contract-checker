
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Router {
    function swapETHForExactTokens(
        uint amountOut,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts) {}
}

contract PegSwap {
    function swap(
        uint256 amount,
        address source,
        address target
    ) external {}
}

contract MyNFT is ERC1155, VRFConsumerBase {
    uint256 SLIPPAGE_PERCENTAGE = 20;
    address CREATOR = 0x0000000000000000000000000000000000000000;
    uint256 public PRICE = 0.1 ether;

    bytes32 VRF_KEYHASH = 0xf86195cf7690c55907b2b611ebb7343a6f649bff128701cc542f0569e2c549da;
    uint256 VRF_FEE = 0.0001 ether;
    address VRF_COORDINATOR = 0x3d2341ADb2D31f1c5530cDC622016af293177AE0;

    Router quickswap = Router(0xa5E0829CaCEd8fFDD4De3c43696c57F7D7A678ff);
    PegSwap peg_swap = PegSwap(0xAA1DC356dc4B18f30C347798FD5379F3D77ABC5b);
    ERC20 WMATIC_token  = ERC20(0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270);
    ERC20 LINK_token  = ERC20(0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39);
    ERC20 LINK_ERC677_token  = ERC20(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
    AggregatorV3Interface MATIC_LINK_price_feed = AggregatorV3Interface(0x5787BefDc0ECd210Dfa948264631CD53E68F7802);

    mapping(bytes32  => address) public sender_request_ids;

    constructor()
        ERC1155("https://YOURURL/{id}.json")
        VRFConsumerBase(
            VRF_COORDINATOR,
            address(LINK_token)
        )
    {
    }

    function mintNFT(address to) public payable
    {
        require(msg.value >= PRICE, "Value below price");
        swapMATICToLINK();
        sender_request_ids[requestRandomness(VRF_KEYHASH, VRF_FEE)] = to;
    }

    function swapMATICToLINK() public payable
    {
        address[] memory path = new address[](2);
        path[0] = address(WMATIC_token);
        path[1] = address(LINK_token);

        quickswap.swapETHForExactTokens{value: getMaticPrice() * VRF_FEE * (100+SLIPPAGE_PERCENTAGE) / 100}(
            VRF_FEE,
            path,
            address(this),
            block.timestamp
        );
        LINK_token.approve(address(peg_swap), VRF_FEE);
        peg_swap.swap(
            VRF_FEE,
            address(LINK_token),
            address(LINK_ERC677_token)
        );
    }

    function getMaticPrice() public view returns (uint) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = MATIC_LINK_price_feed.latestRoundData();
        roundID;
        startedAt;
        timeStamp;
        answeredInRound;
        return uint(price);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        uint token_id = randomness % 2 + 1;
        uint amount = 1;
        _mint(sender_request_ids[requestId], token_id, amount, "");
    }

    function withdraw() public
    {
        payable(CREATOR).transfer(address(this).balance);
        LINK_token.transfer(payable(CREATOR), LINK_token.balanceOf(address(this)));
        LINK_ERC677_token.transfer(payable(CREATOR), LINK_ERC677_token.balanceOf(address(this)));
    }
}
