schemaVersion = 1
name = "xxxxxxx"
contractAddress = "0x..."
maxTaskDuration = "0s"
observationSource = """
    decode_log   [type=ethabidecodelog
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type=cborparse data="$(decode_log.data)"]
    fetch_1        [type=bridge name="bridgeTwo" requestData="{\\"id\\": $(jobSpec.externalJobID), \\"data\\": { \\"txh\\": $(decode_cbor.txh)}}"]
    parse_1        [type=jsonparse path="result" data="$(fetch_1)"]
    fetch_2        [type=bridge name="Test1" requestData="{\\"id\\": $(jobSpec.externalJobID), \\"data\\": { \\"txh\\": $(decode_cbor.txh)}}"]
    parse_2        [type=jsonparse path="result" data="$(fetch_2)"]
    fetch_3        [type=bridge name="Test2" requestData="{\\"id\\": $(jobSpec.externalJobID), \\"data\\": { \\"txh\\": $(decode_cbor.txh)}}"]
    parse_3        [type=jsonparse path="result" data="$(fetch_3)"]
    fetch_4        [type=bridge name="Test3" requestData="{\\"id\\": $(jobSpec.externalJobID), \\"data\\": { \\"txh\\": $(decode_cbor.txh)}}"]
    parse_4        [type=jsonparse path="result" data="$(fetch_4)"]
    fetch_5        [type=bridge name="Test4" requestData="{\\"id\\": $(jobSpec.externalJobID), \\"data\\": { \\"txh\\": $(decode_cbor.txh)}}"]
    parse_5        [type=jsonparse path="result" data="$(fetch_5)"]
    my_median_task [type="mode"
                values=<[ $(parse_1), $(parse_2), $(parse_3), $(parse_4), $(parse_5) ]>
                allowedFaults=2]
    parse_mode   [type=jsonparse path="result,0" data="$(my_median_task)"]
    encode_data  [type=ethabiencode 
                abi="(bytes value)" 
                data="{ \\"value\\": $(parse_mode) }"]
    encode_tx    [type=ethabiencode
                  abi="fulfillOracleRequest(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes calldata data)"
                  data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_data)}"
                 ]
    submit_tx    [type=ethtx to="0x327A92FBb7D7c96D349B4207603B910d3c40c9F5" data="$(encode_tx)"]

    decode_log -> decode_cbor -> fetch_1 -> parse_1 -> fetch_2 -> parse_2 -> fetch_3 -> parse_3 -> fetch_4 -> parse_4 -> fetch_5 -> parse_5 -> my_median_task -> parse_mode -> encode_data -> encode_tx -> submit_tx
"""
externalJobID = "ab58325c-1d12-4360-a15d-c656eca27dc0"
