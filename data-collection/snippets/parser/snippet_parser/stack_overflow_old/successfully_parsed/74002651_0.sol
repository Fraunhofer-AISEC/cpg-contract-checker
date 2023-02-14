pragma solidity ^0.8.0;

contract TotSup {

    uint256 public hasilBal;
    uint256 public hasil;

    function balanceOf(address erc1155_address, 
        address user_address, 
        uint256 nft_id) public {

        (bool successA, bytes memory resultA) = 
            erc1155_address.call(abi.encodeWithSignature(
                "balanceOf(address,uint256)", 
                user_address, 
                nft_id
        ));

        hasil = abi.decode(resultA, (uint256));

    }

    function bal(address erc1155_address, uint256 nft_id) public {
        (bool successA, bytes memory resultA) = 
            erc1155_address.call(
                abi.encodeWithSignature("totalSupply(uint256)", nft_id
        ));

        hasilBal = abi.decode(resultA, (uint256)); 
    }

}
