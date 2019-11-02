public class myEdge{
    int fromVertex;//起点
    int endVertex;//终点
    int weight;//权重

    public myEdge(int fromVertex,int endVertex){ //无权图的初始化
        this.fromVertex = fromVertex;
        this.endVertex = endVertex;
        this.weight = 1;
    }

    public myEdge(int fromVertex,int endVertex,int weight){ //有权图的初始化
        this.fromVertex = fromVertex;
        this.endVertex = endVertex;
        this.weight = weight;
    }

}
