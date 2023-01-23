 function getFunds() public returns(uint) {
        emit UpdateStatus('Someone called a getter!');
        return address(this).balance;
}
