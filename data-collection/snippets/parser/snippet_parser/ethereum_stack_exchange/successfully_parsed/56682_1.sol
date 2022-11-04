 function receiveApproval(address _sender, uint256 _value,
        address _tokenContract, bytes data) public {
        RecommendContract recommend = RecommendContract(0x4B3F6Bda49BdF8786554af1aD97D773C450375F0);

         uint8 serviceSelector = extractSelector(data);
          if (serviceSelector == 3) {
            
            emit LogEvent("ADD VACANCY SERVICE");
            bytes32 vacancyId = extractBytes32(data,1);
            bytes32 vacancyId = keccak256(data);
            uint256 incentive = extractUint256(data,33);
            recommend.addVacancy(_sender, vacancyId, _value);

        }



    }
