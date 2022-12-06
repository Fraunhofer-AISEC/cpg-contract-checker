export default function CardNft({id}) {

  const [nft, setNft] = useState([])

  useEffect(() => {
    loadNFT()
  }, [])

    async function loadNFT() {
    const provider = new ethers.providers.JsonRpcProvider()
    const contract = new ethers.Contract(marketplaceAddress, NFTMarketplace.abi, provider)
                
    **const data = await contract.getMarketItem(id)** /the problem is here
        const tokenUri = await contract.tokenURI(data.tokenId)
        const meta = await axios.get(tokenUri)
        let price = ethers.utils.formatUnits(data.price.toString(), 'ether')
        let item = {
            price,
            tokenId: data.tokenId,
            seller: data.seller,
            owner: data.owner,
            image: meta.data.image,
            name: meta.data.name,
            description: meta.data.description,
        }
    setNft(item)

      
    }
  return (...) }
