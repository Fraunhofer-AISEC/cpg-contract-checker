import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import {randomness_interface} from "./randomness_interface.sol";

contract Divergence is ERC1155, Ownable  {
    uint256 public constant One = 0;
    uint256 public constant Two = 1;
    uint256 public constant Three = 2;
    uint256 public constant Four = 3;
    
    constructor() ERC1155 ("https://ipfs.io/ipfs/dsfgijdsfklj348rue0ur099045948.json"){
        _mint(msg.sender, item1, 1000, "" );
        _mint(msg.sender, item2, 130, "" );
        _mint(msg.sender, item3, 65, "" );
        _mint(msg.sender, item4, 3, "" );
    }

    function uri(uint256 _tokenId) override public view returns (string memory) {
        return string(
            abi.encodePacked(
                "https://ipfs.io/ipfs/Qmf4WrTGA2fYJXitigvqJ7FDVMPreJQW4of8HZ1k5Wzkd3?filename=Divergence1",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }

    function generateRandomNumber(address _random) external(bytes32 requestId) {
        randomness_interface(_random).fulfillRandomness(uint256);
    }

    function getRandomNumberfromOutside(address _random) external {
        randomness_interface(_random).getRandomNumber(bytes32);
    }
   
