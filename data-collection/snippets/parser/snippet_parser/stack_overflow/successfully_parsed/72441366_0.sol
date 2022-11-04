pragma solidity >0.8.0;

contract compareArrays {
    string[] public ownedSymbols = ["A","B","C"];
    string[] public targetAssets = ["A","B"];
    string[] sellSymbols;

    event sellListEvent(string[]);

    function sellList(string[] memory _ownedSymbols, string[] memory _targetAssetsList) internal {
        sellSymbols = _ownedSymbols;
        for (uint256 i = 0; i < _targetAssetsList.length; i++) {
            for (uint256 x = 0; x < sellSymbols.length; x++) {
                if (
                    keccak256(abi.encodePacked((sellSymbols[x]))) ==
                    keccak256(abi.encodePacked((_targetAssetsList[i])))
                ) {
                    if (x < sellSymbols.length) {
                        sellSymbols[x] = sellSymbols[sellSymbols.length - 1];
                        sellSymbols.pop();
                    } else {
                        delete sellSymbols;
                    }
                }
            }
        }
        emit sellListEvent(sellSymbols);
    }

    function runSellList() public {
        sellList(ownedSymbols,targetAssets);
    }

}
