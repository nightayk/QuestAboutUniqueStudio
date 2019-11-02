public class myQueue<E> {
    private myStack<E> queue = null;
    private myStack<E> temp = null;
    private int queueMaxsize;

    public myQueue(int queueMaxsize){
        this.queueMaxsize = queueMaxsize;
        queue = (myStack<E>)new myStack<E>(queueMaxsize);
        temp = (myStack<E>)new myStack<E>(queueMaxsize);

    }

    public boolean push(E value){
        if(queue.isFull())
            return  false;
        queue.push(value);
        return true;
    }

    public boolean isEmpty(){
        return queue.isEmpty();
    }

    public E pop(){
        if(queue.isEmpty()){
            return null;
        }

        while(queue.size() >= 2){
            temp.push(queue.pop());
        }
        E popValue = queue.pop();

        while(!temp.isEmpty()){
            queue.push(temp.pop());
        }

        return popValue;
    }
}
