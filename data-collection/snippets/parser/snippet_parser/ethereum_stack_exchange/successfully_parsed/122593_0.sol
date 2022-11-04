contract MyContract {

    uint number;

    function getNumber() public view returns (uint) {
        return number;
    }

    function changeNumber(uint newNumber) public {
        number = newNumber;
    }

}
