import java.util.ArrayList;
import java.util.PriorityQueue;

public class myGraph {
    private myEdge[] myEdges;
    private int[][] matrix;
    private boolean hasWeight;
    private boolean hasDirection;
    private int edgeNum;
    private int vertexNum;

    public myGraph(myEdge[] myEdges,boolean hasWeight,boolean hasDirection,int vertexNum){
        this.myEdges = myEdges;
        this.hasWeight = hasWeight;
        this.hasDirection = hasDirection;
        this.vertexNum = vertexNum;
        matrix = (int[][])new int[vertexNum][vertexNum];
        createGraph();
    }

    public void createGraph(){
        for(int i=0;i<vertexNum;i++){
            for(int j=0;j<vertexNum;j++){
                matrix[i][j] = 0;
            }
        }

        edgeNum = myEdges.length;
        for(int i=0;i<edgeNum;i++){
            int from = myEdges[i].fromVertex;
            int end = myEdges[i].endVertex;
            if(hasWeight == false && hasDirection == false){
                matrix[from][end] = 1;
                matrix[end][from] = 1;
            }
            else if(hasWeight == true && hasDirection == false){
                matrix[from][end] = myEdges[i].weight;
                matrix[end][from] = myEdges[i].weight;
            }
            else if(hasWeight == false && hasDirection == true)
                matrix[from][end] = 1;
            else
                matrix[from][end] = myEdges[i].weight;
        }
    }

    public int getDegree(int v){
        int de = 0;
        if(hasDirection)
            de = getInDegree(v) + getOutDegree(v);
        else{
            for(int i=0;i<vertexNum;i++){
                if(matrix[v][i] != 0)
                    de++;
            }
        }
        return de;
    }

    public int getInDegree(int v){
        int inDe = 0;
        for(int i=0;i<vertexNum;i++){
            if(matrix[i][v] != 0)
                inDe++;
        }
        return inDe;
    }

    public int getOutDegree(int v){
        int outDe = 0;
        for(int i=0;i<vertexNum;i++){
            if(matrix[v][i] != 0)
                outDe++;
        }
        return outDe;
    }

    public void DFS(int v,boolean[] visted){
        System.out.print(v+" ");
        visted[v] = true;

        for(int i=0;i<vertexNum;i++){
            if(matrix[v][i] != 0 && !visted[i]){
                DFS(i,visted);
            }
        }
    }

    public void DFS_Re(int startVertex){
        boolean[] visited = new boolean[vertexNum];
        for(int i=0;i<vertexNum;i++)
            visited[i] = false;
        DFS(startVertex,visited);
    }

    public ArrayList<Integer> DFS_Unre(int startVertex){
        if(startVertex >= vertexNum)
            return null;
        ArrayList<Integer> result = new ArrayList<Integer>();
        boolean[] visited = new boolean[vertexNum];
        for(int i=0;i<vertexNum;i++)
            visited[i] = false;
        myStack<Integer> stack = new myStack<Integer>(512);

        stack.push(startVertex);
        visited[startVertex] = true;

        while (!stack.isEmpty()){
            int v = stack.pop();
            result.add(v);

            for(int i=0;i<vertexNum;i++){
                if(matrix[v][i] != 0 && !visited[i]){
                    stack.push(i);
                    visited[i] = true;
                }
            }
        }
        return result;
    }

    public ArrayList<Integer> BFS(int startVertex){
        if(startVertex >= vertexNum)
            return null;
        ArrayList<Integer> result = new ArrayList<Integer>();
        boolean[] visited = new boolean[vertexNum];
        for(int i=0;i<vertexNum;i++)
            visited[i] = false;
        myQueue<Integer> queue = new myQueue<Integer>(512);

        queue.push(startVertex);
        visited[startVertex] = true;

        while (!queue.isEmpty()){
            int v = queue.pop();
            result.add(v);

            for(int i=0;i<vertexNum;i++){
                if(matrix[v][i] != 0 && !visited[i]){
                    queue.push(i);
                    visited[i] = true;
                }
            }
        }
        return result;
    }

    public ArrayList<Integer> topSort(){
        ArrayList<Integer> result = new ArrayList<Integer>();
        int count = 0;//判断是否为环
        int[] inDegree = new int[vertexNum];
        for(int i=0;i<vertexNum;i++){
            inDegree[i] = getInDegree(i);
        }
        myStack<Integer> stack = new myStack<Integer>(512);

        for(int i=0;i<vertexNum;i++){
            if(inDegree[i] == 0){//删除节点
                stack.push(i);
                inDegree[i] = -1;
            }
            while (!stack.isEmpty()){
                int v = stack.pop();
                result.add(v);
                count++;

                for(int j=0;j<vertexNum;j++){
                    if(matrix[v][j] != 0){//删除与节点有关的边
                        matrix[v][j] = 0;
                        inDegree[j]--;
                        if(inDegree[j] == 0){
                            stack.push(j);
                            inDegree[j] = -1;
                        }
                    }
                }
            }
        }

        if(count < vertexNum){
            System.out.println("图内有环");
            return null;
        }
        else
            return result;
    }

    public void weightSort(){
        myEdge temp = new myEdge(-1,-1,-1);
        int i,j;
        for(i=1;i<edgeNum;i++){
            temp.fromVertex = myEdges[i].fromVertex;
            temp.endVertex = myEdges[i].endVertex;
            temp.weight = myEdges[i].weight;
            for(j=i;j>0 && myEdges[j-1].weight>temp.weight;j--){
                myEdges[j].fromVertex = myEdges[j-1].fromVertex;
                myEdges[j].endVertex = myEdges[j-1].endVertex;
                myEdges[j].weight = myEdges[j-1].weight;
            }
            myEdges[j].fromVertex = temp.fromVertex;
            myEdges[j].endVertex = temp.endVertex;
            myEdges[j].weight = temp.weight;
        }
    }

    public ArrayList<myEdge> kruskal(){
        ArrayList<myEdge> MST = new ArrayList<myEdge>();
        int u,v;
        myUFSbyHeight ufs = new myUFSbyHeight(vertexNum);
        weightSort();

        for(int i=0;i<edgeNum;i++){
            if(ufs.findRoot(myEdges[i].fromVertex) != ufs.findRoot(myEdges[i].endVertex)){
                ufs.merge(myEdges[i].fromVertex,myEdges[i].endVertex);
                MST.add(myEdges[i]);
            }
        }

        return MST;
    }

    public int prim(int startVertex){
        int[] lowCost = new int[vertexNum];//lowCost[i]表示V-S中各点i到S的最小权值
        int[] closeSet = new int[vertexNum];//closeSet[i]表示S中与V-S中的i节点离得最近的节点
        boolean[] s = new boolean[vertexNum];

        s[startVertex] = true;
        for(int i=0;i<vertexNum;i++){
            if(i == startVertex)
                continue;
            lowCost[i] = matrix[startVertex][i];//由于S中只有一个节点,所以V-S中各点到S的最小权值都是到startVertex的权值
            closeSet[i] = startVertex;//由于S中只有一个节点,所以离V-S中每个节点i最近的节点肯定是startVertex
            s[i] = false;
        }

        int sum = 0;

        for(int i=1;i<vertexNum;i++){//vertexNum-1次遍历将S扩充成V
            int min = 0;

            int j = startVertex;
            for(int k=0;k<vertexNum;k++){
                if(k == startVertex)
                    continue;
                if(min == 0){
                    min = lowCost[k];
                    j = k;
                }
                if(lowCost[k] != 0 && lowCost[k] < min && !s[k]){
                    min = lowCost[k];
                    j = k;
                }
            }

            s[j] = true;//将j纳入S中
            sum += lowCost[j];

            for(int k=0;k<vertexNum;k++){//加入j后更新lowCost和costSet
                if(!s[k] && matrix[j][k] != 0){
                    if(matrix[j][k] < lowCost[k] || lowCost[k] == 0){
                        lowCost[k] = matrix[j][k];
                        closeSet[k] = j;
                    }
                }
            }
        }

        return sum;
    }

    public int[] dijkstra(int startVertex){
        int dis[] = new int[vertexNum];
        for(int i=0;i<vertexNum;i++)
            dis[i] = 10000;
        class Node implements Comparable<Node>{
            public int i;//节点在数组中的下标
            public int weight;//到该节点的当前最小权值
            public Node(int i,int weight){
                this.i = i;
                this.weight = weight;
            }

            @Override
            public int compareTo(Node node){
                if(this.weight == node.weight)
                    return 0;
                else if(this.weight < node.weight)
                    return -1;
                else
                    return 1;
            }
        }

        PriorityQueue<Node> pq = new PriorityQueue<Node>();

        pq.offer(new Node(startVertex,0));
        dis[startVertex] = 0;

        Node node = null;
        while(!pq.isEmpty()){
            node = pq.poll();

            int i = node.i;
            int weight = node.weight;

            for(int j=0;j<vertexNum;j++){
                if(matrix[i][j] != 0 && dis[j] > dis[i] + matrix[i][j]){
                    dis[j] = dis[i] + matrix[i][j];
                    pq.offer(new Node(j,dis[i] + matrix[i][j]));
                }
            }
        }

        return dis;
    }
}
