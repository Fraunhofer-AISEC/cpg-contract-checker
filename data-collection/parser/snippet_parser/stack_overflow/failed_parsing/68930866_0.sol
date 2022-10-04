   
    
    pragma solidity >=0.7.0 <0.9.0;
    
    contract test {
    
      
    uint V = 9;
    
    function minDistance(uint256 dist,uint256 []sptSet) public returns(uint256 memory txt)
    {
         
        
        uint256 min = Number.MAX_VALUE;
        uint256 min_index = -1;
         
        for(uint256 v = 0; v < V; v++)
        {
            if (sptSet[v] == false && dist[v] <= min)
            {
                min = dist[v];
                min_index = v;
            }
        }
        return min_index;
    }
     
    
    
    function printSolution(uint256 dist) public
    {
        
        for(uint256 i = 0; i < V; i++)
        {
        
        }
    }
    
    function dijkstra(uint256 [] graph, uint256 src) public
    {
        uint256 [] dist = new uint256[V];
        uint256 [] sptSet = new uint256[V];
         
        
        
        for(uint256 i = 0; i < V; i++)
        {
           uint256 dist[i] = Number.MAX_VALUE;
           uint256 sptSet[i] = false;
        }
         
        
        
        dist[src] = 0;
         
        
        for(uint256 count = 0; count < V - 1; count++) 
        {
            uint256 u = minDistance(dist, sptSet);
             
            
            sptSet[u] = true;
             
            
            
            for(uint256 v = 0; v < V; v++)
            {
                               if (!sptSet[v] && graph[u][v] != 0 &&
                       dist[u] != Number.MAX_VALUE &&
                       dist[u] + graph[u][v] < dist[v])
                {
                    dist[v] = dist[u] + graph[u][v];
                }
            }
        }
         
        
        printSolution(dist);
    }
     
    
    uint256 graph = [ [ 0, 4, 0, 0, 0, 0, 0, 8, 0 ],
                  [ 4, 0, 8, 0, 0, 0, 0, 11, 0 ],
                  [ 0, 8, 0, 7, 0, 4, 0, 0, 2 ],
                  [ 0, 0, 7, 0, 9, 14, 0, 0, 0],
                  [ 0, 0, 0, 9, 0, 10, 0, 0, 0 ],
                  [ 0, 0, 4, 14, 10, 0, 2, 0, 0],
                  [ 0, 0, 0, 0, 0, 2, 0, 1, 6 ],
                  [ 8, 11, 0, 0, 0, 0, 1, 0, 7 ],
                  [ 0, 0, 2, 0, 0, 0, 6, 7, 0 ] ];
dijkstra(graph, 0);
    }
