   function _isUniswapV2Pair(address target) internal view returns (bool) {
       address token0;
       address token1;

       string memory targetSymbol = _callAndParseStringReturn(
           target,
           hex"95d89b41" 
       );

       if (bytes(targetSymbol).length == 0) {
           return false;
       }

       if (_compare(targetSymbol, "UNI-V2")) {
           IUniswapV2Pair pairContract = IUniswapV2Pair(target);

           try pairContract.token0() returns (address _token0) {
               token0 = _token0;
           } catch Error(string memory) {
               return false;
           } catch (bytes memory) {
               return false;
           }

           try pairContract.token1() returns (address _token1) {
               token1 = _token1;
           } catch Error(string memory) {
               return false;
           } catch (bytes memory) {
               return false;
           }
       } else {
           return false;
       }

       return target == _dexFactoryV2.getPair(token0, token1);    }

    function _callAndParseStringReturn(address token, bytes4 selector)
       internal
       view
       returns (string memory)
      {
       (bool success, bytes memory data) = token.staticcall(
           abi.encodeWithSelector(selector)
       );

       
       if (!success || data.length == 0) {
           return "";
       }

       
       if (data.length == 32) {
           bytes32 decoded = abi.decode(data, (bytes32));
           return _bytes32ToString(decoded);
       } else if (data.length > 64) {
           return abi.decode(data, (string));
       }
       return "";    }
   
    function _bytes32ToString(bytes32 x) internal pure returns (string memory) {
       bytes memory bytesString = new bytes(32);
       uint256 charCount = 0;
       for (uint256 j = 0; j < 32; j++) {
           bytes1 char = x[j];
           if (char != 0) {
               bytesString[charCount] = char;
               charCount++;
           }
       }
       bytes memory bytesStringTrimmed = new bytes(charCount);
       for (uint256 j = 0; j < charCount; j++) {
           bytesStringTrimmed[j] = bytesString[j];
       }
       return string(bytesStringTrimmed);    }
