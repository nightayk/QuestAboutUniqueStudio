public class Heap<E extends Comparable<E>>{
    private E[] heap = null;
    private int maxsize;
    private int n = 0;

    public Heap(int maxsize){
        this.maxsize = maxsize;
        heap = (E[])new Comparable[maxsize+1];
    }

    public boolean isEmpty(){
        return (n == 0);
    }

    public boolean isFull(){
        return (n == maxsize);
    }

    public int size(){
        return n;
    }

    public boolean insert(E value){
        if(isFull())
            return false;
        heap[++n] = value;
        swim(n);
        return true;
    }

    public E delMax(){
        E max = heap[1];
        exch(1,n--);
        heap[n+1] = null;
        sink(1);
        return max;
    }

    private boolean less(int i,int j){
        return heap[i].compareTo(heap[j]) < 0;
    }

    private void exch(int i,int j){
        E t = heap[i];
        heap[i] = heap[j];
        heap[j] = t;
    }

    private void swim(int k){//上滤
        while(k > 1 && less(k,k/2)){
            exch(k/2,k);
            k = k / 2;
        }
    }

    private void sink(int k){
        while(2*k <= n){
            int j = 2*k;
            if(j < n && less(j,j+1)) j++;
            if(!less(k,j)) break;
            exch(k,j);
            k = j;
        }
    }
}
