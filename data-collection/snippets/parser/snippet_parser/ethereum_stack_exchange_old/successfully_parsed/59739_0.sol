function listTexts () public view returns (bytes32[], uint[]) {

        bytes32[] memory texts = new bytes32[](textArray.length);
        uint[] memory readsArray = new uint[](textArray.length);

        for (uint i = 0; i < textArray.length; i++){
            texts[i] = textArray[i].text;
            readsArray[i] = textArray[i].reads;
        }

        return (texts, readsArray);

}
