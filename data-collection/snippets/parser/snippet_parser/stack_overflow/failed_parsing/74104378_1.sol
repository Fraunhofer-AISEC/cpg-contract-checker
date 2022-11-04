const { config, error } = usePrepareContractWrite({
        addressOrName: props.address,
        contractInterface: props.interface,
        functionName: "counter",
        args: [1]
    })
    const { data, isLoading, isSuccess, write } = useContractWrite(config)

<button onClick={() => write?.()}>Hit me</button>
