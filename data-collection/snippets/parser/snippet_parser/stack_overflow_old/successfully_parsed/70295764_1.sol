interface IGenzees {
    function allGenzeesOfWallet(address owner) external view returns(uint[] memory);
}

contract CallNFT {
    IGenzees public NFTcontract;

    constructor () {
        NFTcontract = IGenzees(0x201675fBFAAAC3A51371E4C31FF73Ac14ceE2A5A);
    }

    function getNoNFTsOwned(address user) public view returns(uint[] memory) {
        return NFTcontract.allGenzeesOfWallet(user);
    }
    function setNFTcontract(address addr) external { 
        NFTcontract = IGenzees(addr);
    }
}
