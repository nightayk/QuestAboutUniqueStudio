public class myStack<E> {
    private E[] data = null;
    private int maxsize;
    private int top = -1;//指向栈顶

    public myStack(int maxsize){
        this.maxsize = maxsize;
        data = (E[])new Object[maxsize];
    }

    public boolean isEmpty(){
        return (top == -1);
    }

    public boolean isFull(){
        return (top == maxsize - 1);
    }

    public boolean push(E value){
        if(isFull())
            return false;
        top++;
        data[top] = value;
        return true;
    }

    public E pop(){
        if(isEmpty())
            return null;
        E popValue = data[top];
        data[top] = null;
        top--;
        return popValue;
    }

    public int size(){
        return top+1;
    }
}
