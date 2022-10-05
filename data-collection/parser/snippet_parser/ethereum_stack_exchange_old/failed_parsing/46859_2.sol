import './Ownable.sol';

contract MyContract is Ownable {
    function start() external onlyOwner {
        ...
    }

    function stop() external onlyOwner {
        ...
    }
}
