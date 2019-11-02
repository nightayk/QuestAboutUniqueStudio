public class myUFSbyHeight {
    private int[] parent;
    private int[] height;
    private int size;

    public myUFSbyHeight(int size){
        this.size = size;
        this.parent = new int[size];
        this.height = new int[size];
        for(int i = 0;i < size;i++){
            this.parent[i] = i;
            this.height[i] = 1;
        }
    }

    public int findRoot(int element){
        while(element != parent[element])
            element = parent[element];
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

        if(height[firstRoot] < height[secondRoot])
            parent[firstRoot] = secondRoot;
        else if(height[firstRoot] > height[secondRoot])
            parent[secondRoot] = firstRoot;
        else{//秩相等时随意,只是要记得+1
            parent[firstRoot] = secondRoot;
            height[secondRoot] += 1;
        }
    }


}
