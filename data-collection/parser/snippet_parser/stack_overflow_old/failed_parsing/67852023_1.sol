type ParamsOfFetch = {
    address: string
}

type ResultOfFetch = {
    info: DebotInfo
}

function fetch(
    params: ParamsOfFetch,
): Promise<ResultOfFetch>;
