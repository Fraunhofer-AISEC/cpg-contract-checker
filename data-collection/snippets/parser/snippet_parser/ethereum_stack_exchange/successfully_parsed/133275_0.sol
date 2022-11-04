

pragma solidity 0.8.16;

contract Contract {


    
    struct DecodedData {
        uint v1;
        uint v2;
        uint v3;
        uint v4;
        uint v5;
        uint v6;
        uint v7;
        uint v8;
        uint v9;
        uint v10;
        uint v11;
        uint v12;
        uint v13;
        uint v14;
        uint v15;
        uint v16;
        uint v17;
        uint v18;
        uint v19;
        uint v20;
        uint v21;
        uint v22;
        uint v23;
        uint v24;
    }

    function encodeNumbersFrom1To24() public pure returns(bytes memory) {
        
        
        bytes memory b = abi.encode(encodeNumbersFrom1To12(), encodeNumbersFrom13To24());
        return b;
    }

    function encodeNumbersFrom1To12() public pure returns(bytes memory) {
        
        bytes memory b = abi.encode(1,2,3,4,5,6,7,8,9,10,11,12);
        return b;
    }

    function encodeNumbersFrom13To24() public pure returns(bytes memory) {
        bytes memory b = abi.encode(13,14,15,16,17,18,19,20,21,22,23,24);
        return b;
    }

    function decode_v1_incomplete(bytes calldata b) public pure returns(uint v1, uint v2, uint v3,uint v4,uint v5,uint v6) {

        (bytes memory firstPart, bytes memory secondPart) = abi.decode(b, (bytes, bytes));

        
        
        (v1,v2,v3,v4,v5,v6) = abi.decode(firstPart, (uint,uint,uint,uint,uint,uint)); 

    }

    function decode_v2(bytes calldata b) public pure returns(DecodedData memory) {

        
        
        DecodedData memory decodedData;

        (bytes memory firstPart, bytes memory secondPart) = abi.decode(b, (bytes, bytes));

        uint from = 0;
        uint increment = 32;

        
        

        bytes memory b32 = get32Bytes(from, firstPart);

        decodedData.v1 = abi.decode(b32, (uint));
        
        from += increment;
        b32 = get32Bytes(from, firstPart);

        decodedData.v2 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);

        decodedData.v3 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v4 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v5 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v6 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v7 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v8 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v9 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v10 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v11 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, firstPart);
        
        decodedData.v12 = abi.decode(b32, (uint));

        
        from = 0;

        b32 = get32Bytes(from, secondPart);

        
        
        decodedData.v13 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v14 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v15 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v16 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v17 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v18 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v19 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v20 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v21 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v22 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v23 = abi.decode(b32, (uint));

        from += increment;
        b32 = get32Bytes(from, secondPart);
        
        decodedData.v24 = abi.decode(b32, (uint));
        
        return decodedData;

    }

    function decode_v3_dynamic(bytes calldata b) public pure returns(uint[] memory) {

        (bytes memory firstPart, bytes memory secondPart) = abi.decode(b, (bytes, bytes));

        uint[] memory firstPartDecodedElements = decodePart(firstPart);
        uint[] memory secondPartDecodedElements = decodePart(secondPart);

        uint[] memory decodedElementsElements = new uint[](firstPartDecodedElements.length + secondPartDecodedElements.length);

        uint j = 0;
        
        for(uint i = 0; i < firstPartDecodedElements.length; i++) {
            decodedElementsElements[j++] = firstPartDecodedElements[i];
        }

        for(uint i = 0; i < firstPartDecodedElements.length; i++) {
            decodedElementsElements[j++] = secondPartDecodedElements[i];
        }
        
        return decodedElementsElements;

    }

    function decodePart(bytes memory part) public pure returns(uint[] memory) {
        uint countOf32BytesElementsInBytes = part.length / 32;
        uint[] memory elements = new uint[](countOf32BytesElementsInBytes);
        uint j = 0;
        for(uint i = 0; i < countOf32BytesElementsInBytes; i++) {
            bytes memory b = get32Bytes(j, part);
            elements[i] = abi.decode(b, (uint));
            j += 32;
        }
        return elements;
    }

    
    function get32Bytes(uint fromIndex, bytes memory b) private pure returns(bytes memory) {
        bytes memory b32 = new bytes(32);
        uint j = fromIndex;
        for(uint i = 0; i < 32; i++) {
            b32[i] = b[j];
            j++;
        }
        return b32;
    }

}

