uint256 public totalGenomes;
mapping(uint256 => string) public genomesList;

function addGenome(string[] memory genome) public {
        for (uint256 index = totalGenomes; index < (1000 + totalGenomes); index++) {
            genomesList[index] = genome[index];
        }
        totalGenomes += 1000;
    }
