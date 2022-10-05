    function get_unconfirmed() public view returns (address[] memory, uint[] memory, uint[] memory) {
   
        address     [] memory _address;
        uint        [] memory _wei;
        uint256     [] memory _ssboe;

        for(uint i = 0; i < deposit_request.length; i++){
            
            if(deposit_request[i]._confirmed){
                _address.push(deposit_request[i]._owner);
                _wei.push(deposit_request[i]._value);
                _ssboe.push(deposit_request[i]._ssboe);
            }

        }

        return (_address, _wei, _ssboe);
    }
