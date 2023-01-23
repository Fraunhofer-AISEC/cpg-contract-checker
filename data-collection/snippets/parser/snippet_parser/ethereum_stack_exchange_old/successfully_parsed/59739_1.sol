function listTexts () public view returns (bytes32[], uint[], address[]) {

        bytes32[] memory texts = new bytes32[](textArray.length);
        uint[] memory readsArray = new uint[](textArray.length);
        address[] memory addresses = new address[](textArray.length);

        for (uint i = 0; i < textArray.length; i++){
            texts[i] = textArray[i].text;
            readsArray[i] = textArray[i].reads;
            addresses[i] = textArray[i].addr;
        }

        return (texts, readsArray, addresses);

}
