import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

...

contract Raffle is VRFConsumerBase, IERC721Receiver {

    enum State {
        Pending,
        Active,
        Calculating,
        Finished
    }

    State public state;

    ...
    ...

    function onERC721Received(address, address, uint256, bytes calldata) external override returns (bytes4) {
        state = State.Active;
        
        return IERC721Receiver.onERC721Received.selector;
    }
