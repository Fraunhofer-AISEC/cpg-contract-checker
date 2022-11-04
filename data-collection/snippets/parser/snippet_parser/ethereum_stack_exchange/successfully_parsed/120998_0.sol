
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

library Base64 {
    string internal constant TABLE_ENCODE =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    bytes internal constant TABLE_DECODE =
        hex"0000000000000000000000000000000000000000000000000000000000000000"
        hex"00000000000000000000003e0000003f3435363738393a3b3c3d000000000000"
        hex"00000102030405060708090a0b0c0d0e0f101112131415161718190000000000"
        hex"001a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132330000000000";

    function encode(bytes memory data) internal pure returns (string memory) {
        if (data.length == 0) return "";

        
        string memory table = TABLE_ENCODE;

        
        uint256 encodedLen = 4 * ((data.length + 2) / 3);

        
        string memory result = new string(encodedLen + 32);

        assembly {
            
            mstore(result, encodedLen)

            
            let tablePtr := add(table, 1)

            
            let dataPtr := data
            let endPtr := add(dataPtr, mload(data))

            
            let resultPtr := add(result, 32)

            
            for {

            } lt(dataPtr, endPtr) {

            } {
                
                dataPtr := add(dataPtr, 3)
                let input := mload(dataPtr)

                
                mstore8(
                    resultPtr,
                    mload(add(tablePtr, and(shr(18, input), 0x3F)))
                )
                resultPtr := add(resultPtr, 1)
                mstore8(
                    resultPtr,
                    mload(add(tablePtr, and(shr(12, input), 0x3F)))
                )
                resultPtr := add(resultPtr, 1)
                mstore8(
                    resultPtr,
                    mload(add(tablePtr, and(shr(6, input), 0x3F)))
                )
                resultPtr := add(resultPtr, 1)
                mstore8(resultPtr, mload(add(tablePtr, and(input, 0x3F))))
                resultPtr := add(resultPtr, 1)
            }

            
            switch mod(mload(data), 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }
        }

        return result;
    }

    function decode(string memory _data) internal pure returns (bytes memory) {
        bytes memory data = bytes(_data);

        if (data.length == 0) return new bytes(0);
        require(data.length % 4 == 0, "invalid base64 decoder input");

        
        bytes memory table = TABLE_DECODE;

        
        uint256 decodedLen = (data.length / 4) * 3;

        
        bytes memory result = new bytes(decodedLen + 32);

        assembly {
            
            let lastBytes := mload(add(data, mload(data)))
            if eq(and(lastBytes, 0xFF), 0x3d) {
                decodedLen := sub(decodedLen, 1)
                if eq(and(lastBytes, 0xFFFF), 0x3d3d) {
                    decodedLen := sub(decodedLen, 1)
                }
            }

            
            mstore(result, decodedLen)

            
            let tablePtr := add(table, 1)

            
            let dataPtr := data
            let endPtr := add(dataPtr, mload(data))

            
            let resultPtr := add(result, 32)

            
            for {

            } lt(dataPtr, endPtr) {

            } {
                
                dataPtr := add(dataPtr, 4)
                let input := mload(dataPtr)

                
                let output := add(
                    add(
                        shl(
                            18,
                            and(
                                mload(add(tablePtr, and(shr(24, input), 0xFF))),
                                0xFF
                            )
                        ),
                        shl(
                            12,
                            and(
                                mload(add(tablePtr, and(shr(16, input), 0xFF))),
                                0xFF
                            )
                        )
                    ),
                    add(
                        shl(
                            6,
                            and(
                                mload(add(tablePtr, and(shr(8, input), 0xFF))),
                                0xFF
                            )
                        ),
                        and(mload(add(tablePtr, and(input, 0xFF))), 0xFF)
                    )
                )
                mstore(resultPtr, shl(232, output))
                resultPtr := add(resultPtr, 3)
            }
        }

        return result;
    }
}

contract SwordNft is ERC721, ERC721Enumerable, Ownable {
    mapping(string => bool) private takenNames;
    mapping(uint256 => Attr) public attributes;

    struct Attr {
        string name;
        string personality;
        uint8 magic;
        uint8 attack;
        uint8 defence;
    }

    constructor() ERC721("Logo", "LOGO") {}

    function uint2str(uint256 _i)
        internal
        pure
        returns (string memory _uintAsString)
    {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721) {
        super._burn(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function mint(
        
        uint256 tokenId,
        string memory _name,
        string memory _personality,
        uint8 _magic,
        uint8 _attack,
        uint8 _defence
    ) public onlyOwner {
        
        _safeMint(msg.sender, tokenId);
        attributes[tokenId] = Attr(
            _name,
            _personality,
            _magic,
            _attack,
            _defence
        );
    }

    function getSvg(uint256 tokenId) private view returns (string memory) {
        string memory svg;
        
        
        
        svg = "<svg xmlns='http://www.w3.org/2000/svg' "
        "xmlns:xlink='http://www.w3.org/1999/xlink' "
        "xmlns:krita='http://krita.org/namespaces/svg/krita' "
        "xmlns:sodipodi='http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd' "
        "width='612pt' "
        "height='612pt' "
        "viewBox='0 0 612 612'>"
        "<defs/>"
        "<rect id='shape0' transform='translate(93.3600000000001, 371.28)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='square' stroke-linejoin='bevel' width='178.56' height='124.8' rx='16.8000077993148' ry='16.8000077993148'/><rect id='shape0' transform='matrix(0.99999997569937 0 0 0.99999997569937 330.96000216956 371.280001516359)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='square' stroke-linejoin='bevel' width='178.56' height='124.8' rx='17.2799982503546' ry='17.2799982503546'/><path id='shape1' transform='translate(276.24, 396.715956588317)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='square' stroke-linejoin='miter' stroke-miterlimit='2' d='M0 5.76404C25.2056 -5.2826 34.8583 2.33406 48 5.76404'/><path id='shape2' transform='translate(74.64, 97.0737938827687)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='square' stroke-linejoin='miter' stroke-miterlimit='2' d='M0 213.006C8.18679 -68.0716 449.743 -73.9175 452.64 213.006'/><path id='shape3' transform='translate(81.3599946392715, 287.28)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='square' stroke-linejoin='miter' stroke-miterlimit='2' d='M0 23.8186C169.241 -10.3126 279.665 -5.77561 443.52 24.7976'/><path id='shape4' transform='translate(122.64, 101.999992262785)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='round' stroke-linejoin='miter' stroke-miterlimit='1.92' d='M149.28 0C84.226 30.1847 16.5563 89.7331 0 194.88'/><path id='shape01' transform='matrix(-0.999999968061144 0 0 0.999999968061144 485.279997616084 101.999992262784)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='square' stroke-linejoin='miter' stroke-miterlimit='2' d='M141.84 0C80.0283 30.4077 15.7311 90.3962 0 196.32'/><text id='shape5' krita:useRichText='true' transform='translate(207.0165625, 265.88)' fill='#212121' stroke='#000000' stroke-opacity='0' stroke-width='0' stroke-linecap='square' stroke-linejoin='bevel' font-family='Open Sans SemiBold' font-size='125' font-size-adjust='0.375679' font-stretch='normal' kerning='0' letter-spacing='0' word-spacing='0'><tspan x='0'>K O</tspan></text><path id='shape6' transform='translate(41.04, 311.28)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='round' stroke-linejoin='miter' stroke-miterlimit='1.92' d='M5.728 42.733C-7.33935 37.0353 1.95131 22.7909 33.6 0'/><path id='shape7' transform='translate(281.04, 88.6473749961536)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='square' stroke-linejoin='miter' stroke-miterlimit='2' d='M0 6.63263C4.00136 -0.81481 41.3136 -3.50521 48 6.63263'/><path id='shape8' transform='translate(50.6400000000001, 330.48)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='round' stroke-linejoin='miter' stroke-miterlimit='1.92' d='M0 24C169.42 -10.4698 337.212 -5.43121 504 24'/><path id='shape02' transform='matrix(-0.999999978175711 0 0 0.999999978175711 561.840000406623 311.033500659559)' fill='none' stroke='#212121' stroke-width='14.4' stroke-linecap='round' stroke-linejoin='miter' stroke-miterlimit='1.91999995708466' d='M5.728 42.733C-7.33935 37.0353 1.95131 22.7909 33.6 0'/>"
        "</svg>";
        return svg;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721)
        returns (string memory)
    {
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        attributes[tokenId].name,
                        '",',
                        '"image_data": "',
                        getSvg(tokenId),
                        '",',
                        '"attributes": [{"trait_type": "Magic", "value": ',
                        uint2str(attributes[tokenId].magic),
                        "},",
                        '{"trait_type": "Attack", "value": ',
                        uint2str(attributes[tokenId].attack),
                        "},",
                        '{"trait_type": "Defence", "value": ',
                        uint2str(attributes[tokenId].defence),
                        "},",
                        '{"trait_type": "Personality", "value": "',
                        attributes[tokenId].personality,
                        '"}',
                        "]}"
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }
}

