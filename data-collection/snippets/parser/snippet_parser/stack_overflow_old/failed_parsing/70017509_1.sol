type = "directrequest"
schemaVersion = 1
name = "mysocialcontract-ea-job"
contractAddress = "0x2Db11F9E1d0a1cDc4e3F4C75B4c14f4a4a1a3518"
maxTaskDuration = "0s"
observationSource = """
    decode_log   [type="ethabidecodelog"
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]
    decodecbor  [type="cborparse" data="$(decode_log.data)"]
    fetch  [type="bridge" name="mysocialcontract" requestData="{\\"id\\": \\"0\\", \\"data\\": {\\"ytChannelId\\": $(decodecbor.ytChannelId)}}"]
    decode_log -> decodecbor -> fetch
    ytSubs    [type=jsonparse path="result,ytSubs"]
    ytViews    [type=jsonparse path="result,ytViews"]
    fetch -> ytSubs 
    fetch -> ytViews
    ytSubs -> encode_mwr
    ytViews -> encode_mwr
    encode_mwr [type=ethabiencode abi="(bytes32 _requestId, uint256 _ytViews, uint256 _ytSubs)"
            data="{\\"_requestId\\": $(decode_log.requestId),\\"_ytViews\\": $(ytViews),\\"_ytSubs\\": $(ytSubs)}"]
    encode_tx [type=ethabiencode
            abi="fulfillOracleRequest2(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes calldata data)"
            data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_mwr)}"]
    submit [type=ethtx to="0x2Db11F9E1d0a1cDc4e3F4C75B4c14f4a4a1a3518" data="$(encode_tx)" gasLimit="5000000"]
    encode_mwr -> encode_tx -> submit
"""
