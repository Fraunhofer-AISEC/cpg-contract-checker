import './BaconMaker.sol';

contract Farm {
    address public owner;
    mapping(address => bool) public pigs;
    BaconMaker[] public baconMakers;

    function Farm() {
        owner = msg.sender;
    }

    function addPig(address pig) external {
        require(pig != 0x0);
        require(msg.sender == owner);
        pigs[pig] = true;
        BaconMaker baconMaker = new BaconMaker(pig);
        baconMakers.push(baconMaker);
    }

}
