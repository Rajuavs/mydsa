/**
 * Block Placement Queries
 * There exists an infinite number line, with its origin at 0 and extending towards the positive x-axis.

You are given a 2D array queries, which contains two types of queries:

For a query of type 1, queries[i] = [1, x]. Build an obstacle at distance x from the origin. It is guaranteed that there is no obstacle at distance x when the query is asked.
For a query of type 2, queries[i] = [2, x, sz]. Check if it is possible to place a block of size sz anywhere in the range [0, x] on the line, such that the block entirely lies in the range [0, x]. A block cannot be placed if it intersects with any obstacle, but it may touch it. Note that you do not actually place the block. Queries are separate.
Return a boolean array results, where results[i] is true if you can place the block specified in the ith query of type 2, and false otherwise.

 

Example 1:

Input: queries = [[1,2],[2,3,3],[2,3,1],[2,2,2]]

Output: [false,true,true]

Explanation:



For query 0, place an obstacle at x = 2. A block of size at most 2 can be placed before x = 3.

Example 2:

Input: queries = [[1,7],[2,7,6],[1,2],[2,7,5],[2,7,6]]

Output: [true,true,false]

Explanation:



Place an obstacle at x = 7 for query 0. A block of size at most 7 can be placed before x = 7.
Place an obstacle at x = 2 for query 2. Now, a block of size at most 5 can be placed before x = 7, and a block of size at most 2 before x = 2.
 
 */

class Solution {
  List<bool> getResuls(List<List<int>> queries) {
    List<bool> results = [];
    Set<int> obstacles = {};

    for (List<int> query in queries) {
      if (query[0] == 1) {
        // Type 1 query: Build an obstacle
        obstacles.add(query[1]);
      } else if (query[0] == 2) {
        // Type 2 query: Check if a block can be placed
        int x = query[1];
        int sz = query[2];

        List<int> currentObstacles = obstacles
            .where((obstacle) => obstacle >= 0 && obstacle <= x)
            .toList();

        currentObstacles.sort();

        int previousObstacle = 0;
        int maxGapSize = 0;
        // Check for obstacles in the range [0, x]

        for (int obstacle in currentObstacles) {
          maxGapSize = maxGapSize > (obstacle - previousObstacle)
              ? maxGapSize
              : (obstacle - previousObstacle);
          // if (maxGapSize >= sz) {
          //   canPlaceBlock = true;
          //   break;
          // }
          previousObstacle = obstacle;
        }
        // Check the gap after the last obstacle up to x
        maxGapSize = maxGapSize > (x - previousObstacle)
            ? maxGapSize
            : (x - previousObstacle);
        // if (maxGapSize >= sz) {
        //   canPlaceBlock = true;
        // }
        bool canPlaceBlock = maxGapSize >= sz;
        results.add(canPlaceBlock);
      }
    }

    return results;
  }
}

void main() {
  Solution solution = Solution();

  print(
    solution.getResuls([
      [1, 2],
      [2, 3, 3],
      [2, 3, 1],
      [2, 2, 2],
    ]),
  ); // Output: [false, true, true]
  print(
    solution.getResuls([
      [1, 7],
      [2, 7, 6],
      [1, 2],
      [2, 7, 5],
      [2, 7, 6],
    ]),
  ); // Output: [true, true, false]
}
