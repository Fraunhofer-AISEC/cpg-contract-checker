bytes32 queryId = oraclize_query(
            "nested", 
            "[URL] ['json(https://api.random.org/json-rpc/1/invoke).result.random[\"data\"]', '\\n{\"jsonrpc\": \"2.0\", \"method\": \"generateIntegers\", \"params\": { \"apiKey\": \"keyGoesHere\"}\", \"n\": 1,\"min\": 0, \"max\":'"+maxNumber-1+"', \"replacement\": true }, \"id\": 14215${[identity] \"}\"}']",
            gasForOraclize
        );
