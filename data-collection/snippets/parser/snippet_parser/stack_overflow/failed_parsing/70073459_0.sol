type = "directrequest"
schemaVersion = 1
name = "eth-lottery-job-test4"
contractAddress = "0x1Cc100f9c198d9CD3410263D4Df7FA7C5C30E34F"
maxTaskDuration = "0s"
observationSource = """
    decode_log   [type="ethabidecodelog"
                  abi="OracleRequest(bytes32 indexed specId, address requester, bytes32 requestId, uint256 payment, address callbackAddr, bytes4 callbackFunctionId, uint256 cancelExpiration, uint256 dataVersion, bytes data)"
                  data="$(jobRun.logData)"
                  topics="$(jobRun.logTopics)"]

    decode_cbor  [type="cborparse" data="$(decode_log.data)"]
    fetch        [type="bridge" name="eth-lottery-test" requestData="{\\"id\\":$(jobSpec.externalJobID), \\"data\\": {\\"username\\":$(decode_cbor.username), \\"password\\":$(decode_cbor.password), \\"winner_ticket\\":$(decode_cbor.winner_ticket), \\"tickets\\":$(decode_cbor.tickets)}}"]
    parse        [type="jsonparse" path="data,winners" data="$(fetch)"]
    encode_data  [type="ethabiencode" abi="(uint256[] winners)" data="{ \\"winners\\": $(parse) }"]
    encode_tx    [type="ethabiencode"
                  abi="fulfillOracleRequest(bytes32 requestId, uint256 payment, address callbackAddress, bytes4 callbackFunctionId, uint256 expiration, bytes32 data)"
                  data="{\\"requestId\\": $(decode_log.requestId), \\"payment\\": $(decode_log.payment), \\"callbackAddress\\": $(decode_log.callbackAddr), \\"callbackFunctionId\\": $(decode_log.callbackFunctionId), \\"expiration\\": $(decode_log.cancelExpiration), \\"data\\": $(encode_data)}"
                 ]
    submit_tx    [type="ethtx" to="0x1Cc100f9c198d9CD3410263D4Df7FA7C5C30E34F" data="$(encode_tx)"]

    decode_log -> decode_cbor -> fetch -> parse -> encode_data -> encode_tx -> submit_tx
"""
