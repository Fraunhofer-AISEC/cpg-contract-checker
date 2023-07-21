export async function getStaticPaths(){
    const provider=new ethers.providers.JsonRpcProvider(
        AlchemyProvider
    );
    const contract=new ethers.Contract(
    contractAddress,
    CampaignFactory.abi,
    provider
    )
    const getAllCampaigns=contract.filters.createdCampaign();
    const allCampaigns=await contract.queryFilter(getAllCampaigns);
    return{
    paths:allCampaigns.map((e)=>({
    params:{```
    **The Problem is coming here**
    **address:e.args.campaignAddress.toString()**
    }
    })),
    fallback:true
    }
    };
