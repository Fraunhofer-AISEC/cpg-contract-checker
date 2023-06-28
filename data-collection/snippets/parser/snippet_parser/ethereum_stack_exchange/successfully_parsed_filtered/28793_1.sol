    string memory string1 = "[URL] ['json(https://api.random.org/json-rpc/1/invoke).result.random', '\\n{\"jsonrpc\":\"2.0\",\"method\":\"generateIntegers\",\"params\":{\"apiKey\":${[decrypt] BP/GT8fDh+lRNPRE4RWT/86Hcypys4kfapOzLwEHs56g4HrWhISOEKm+oKQy96i5rQnv2+mGbHNNTywqWslefgoRaYVFqXUB6cjEpKCK5XfZrDStmpftxmuO/Ekhqjj3cltH5BxYUO/PUIBzkpRECDTXP0ByjaM=},\"n\":1,\"min\":0,\"max\":";

    string memory string2 = uint2str(100);

    string memory string3 = ",\"replacement\":true,\"base\":10${[identity] \"}\"},\"id\":1${[identity] \"}\"}']";

    string memory query = strConcat(string1, string2, string3);

    bytes32 rngId = oraclize_query("nested", query);
