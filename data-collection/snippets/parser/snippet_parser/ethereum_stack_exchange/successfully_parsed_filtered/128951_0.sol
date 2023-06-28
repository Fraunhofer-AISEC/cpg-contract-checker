contract MyContract {

    

    function pickNumbers(uint[5] memory _stdNumbers, uint memory _specialNumber) public {

        for(uint i=0; i<_stdNumbers.length; i++) {
            require(_stdNumbers[i] > 0 && _stdNumbers[i] < 70, "Invalid standard number");
        }

        require(_specialNumber > 0 && _specialNumber < 27, "Invalid special number");

        

    }
}
