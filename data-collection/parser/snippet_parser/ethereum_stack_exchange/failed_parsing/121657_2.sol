export function IsManager(address: string | Falsy) {
    const [isManager]: any =
    useContractCall({
        abi: interfaceAbi,
        address: tokenAdrress,
        method: "manager",
        args: []
    }) ?? [];
    return isManager;
}

const { account } = useEthers();
const etherBalance = useEtherBalance(account);
const isManager = IsManager(account);
