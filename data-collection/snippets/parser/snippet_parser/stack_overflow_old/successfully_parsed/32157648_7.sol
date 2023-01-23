pragma solidity 0.5.0;
pragma experimental ABIEncoderV2;


contract StringUtils {

    function conc( string memory tex) public payable returns(string 
                   memory result){
        string memory _result = string(abi.encodePacked('-->', ": ", tex));
        return _result;
    }

}
