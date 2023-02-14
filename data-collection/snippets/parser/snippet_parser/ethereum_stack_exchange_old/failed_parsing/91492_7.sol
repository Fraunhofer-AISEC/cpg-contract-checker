import { ethers } from 'hardhat';

static getContractAddress(address: string, nonce: number): string {
    const rlp_encoded = ethers.utils.RLP.encode(
        [address, ethers.BigNumber.from(nonce.toString()).toHexString()]
    );
    const contract_address_long = ethers.utils.keccak256(rlp_encoded);
    const contract_address = '0x'.concat(contract_address_long.substring(26));
    return ethers.utils.getAddress(contract_address);
}

