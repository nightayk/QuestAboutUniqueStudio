import java.util.ArrayList;

public class myUFSbyWeight {
    private int parent[];
    private int weight[];
    private int size;

    public myUFSbyWeight(int size){
        this.size = size;
        this.parent = new int[size];
        this.weight = new int[size];

        for(int i=0;i<size;i++){
            this.parent[i] = i;
            this.weight[i] = 1;
        }
    }

    public int findRoot(int element){
        while(element != parent[element]){
            parent[element] = parent[parent[element]];
            element = parent[element];
        }
        return element;
    }

    public boolean isConnected(int first,int second){
        return findRoot(first)==findRoot(second);
    }

    public void merge(int first,int second){
        int firstRoot = findRoot(first);
        int secondRoot = findRoot(second);

        if(firstRoot == secondRoot)
            return;

        if(weight[firstRoot] > weight[secondRoot]){
            parent[secondRoot] = firstRoot;
            weight[firstRoot] += weight[secondRoot];
        }
        else{
            parent[firstRoot] = secondRoot;
            weight[secondRoot] += weight[firstRoot];
        }
    }

}
