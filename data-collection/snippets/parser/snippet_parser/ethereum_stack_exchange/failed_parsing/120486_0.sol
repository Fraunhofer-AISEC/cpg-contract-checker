type = "directrequest"
schemaVersion = 1
name = "some-name"
contractAddress = "ORACLE_ADDRESS_IS_CORRECT_HERE"
maxTaskDuration = "0s"
observationSource = """
    decode_log   [type="ethabidecodelog"
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type="cborparse" data="$(decode_log.data)"]
    fetch        [type="bridge" name="my-adapter" requestData="{\\"data\\": {\\"lichess_token\\": $(decode_cbor.apiToken)}}"]
    parse_acc    [type=jsonparse path="data,verified" data="$(fetch)"]
    parse_accid  [type=jsonparse path="data,url" data="$(fetch)"]
    encode_data  [type=ethabiencode 
                  abi="(uint256 requestIdx, bool accountVerified, bytes accountId)" 
                  data="{ \\"requestIdx\\": $(decode_cbor.requestIdx), \\"accountVerified\\": $(parse_acc), \\"accountId\\": $(parse_accid) }"
                 ]
    encode_tx    [type=ethabiencode
                  abi="fulfillOracleRequest(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes32 data)"
                  data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_data)}"
                 ]
    submit_tx    [type=ethtx to="ORACLE_ADDRESS_IS_CORRECT_HERE" data="$(encode_tx)"]

    decode_log -> decode_cbor -> fetch -> parse_acc -> parse_accid -> encode_data -> encode_tx -> submit_tx
"""
externalJobID = "27cd13da-85cd-44b1-8851-78500663ffa0"
