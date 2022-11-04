pragma solidity >=0.8.0;

function withdraw() {
    payable(msg.sender).transfer(address(this).balance);
}
