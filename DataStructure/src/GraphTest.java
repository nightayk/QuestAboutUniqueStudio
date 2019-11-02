import java.util.ArrayList;

public class GraphTest {
    public static void main(String args[]){
        myEdge[] edges1 = new myEdge[8];
        edges1[0] = new myEdge(5,4,1);
        edges1[1] = new myEdge(0,1,4);
        edges1[2] = new myEdge(2,1,9);
        edges1[3] = new myEdge(2,3,5);
        edges1[4] = new myEdge(0,3,7);
        edges1[5] = new myEdge(1,5,3);
        edges1[6] = new myEdge(0,4,2);
        edges1[7] = new myEdge(2,4,6);

        myGraph graph1 = new myGraph(edges1,true,true,6);

        //DFS递归
        graph1.DFS_Re(0);
        System.out.println("");
        graph1.DFS_Re(2);
        System.out.println("");

        //DFS和BFS非递归以及拓扑
        System.out.println(graph1.DFS_Unre(0)+""+graph1.DFS_Unre(2));
        System.out.println(graph1.BFS(0)+""+graph1.BFS(2));
        System.out.println(graph1.topSort());

        myEdge[] edges2 = new myEdge[7];
        edges2[0] = new myEdge(0,2,1);
        edges2[1] = new myEdge(2,4,5);
        edges2[2] = new myEdge(4,5,2);
        edges2[3] = new myEdge(0,1,7);
        edges2[4] = new myEdge(1,3,4);
        edges2[5] = new myEdge(3,5,3);
        edges2[6] = new myEdge(3,0,9);

        myGraph graph2 = new myGraph(edges2,true,false,6);

        //最小生成树
        ArrayList<myEdge> kruskal = graph2.kruskal();
        for(myEdge e:kruskal)
            System.out.print("("+e.fromVertex+","+e.endVertex+")");
        System.out.println(graph2.prim(0));

        for(int i:graph2.dijkstra(0))
            System.out.print(i+" ");
    }
}
