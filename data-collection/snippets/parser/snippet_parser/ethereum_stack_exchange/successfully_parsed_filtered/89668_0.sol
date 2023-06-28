        Individual[] memory newPop = new Individual[](popSize);
        for(uint i = 0; i < popSize; i++){
            uint index1;
            uint index2;
            (index1, index2) = getIndex();
            Individual newIndiv = crossover(index1, index2);
            newPop.push(newIndiv);
        }

