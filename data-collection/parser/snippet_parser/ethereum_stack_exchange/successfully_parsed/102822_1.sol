
pragma solidity ^0.8.0;


contract Swaper0x {

    string private api0xUrl = 'https://api.0x.org/swap/v1/quote';
    string private sellStr = '?sellToken=';
    string private buyStr = '&buyToken=';
    string private buyAmountStr = '&buyAmount=';
    

    function concat(bytes memory a, bytes memory b) internal pure returns (bytes memory) {
        return abi.encodePacked(a, b);
    }

    function getRequestSELLBUY(
        string memory _sellToken, 
        string memory _buyToken,
        string memory _buyAmount
    ) internal view returns (string memory) {
           
        return string(bytes(api0xUrl) 
            .concat(bytes(sellStr))
            .concat(bytes(_sellToken))
            .concat(bytes(buyStr))
            .concat(bytes(_buyToken))
            .concat(bytes(buyAmountStr))
            .concat(abi.encodePacked(_buyAmount)));
    }
}
