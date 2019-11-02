import java.nio.file.NotDirectoryException;

public class myBST<E extends  Comparable<E>> {
    private Node<E> root = null;

    private class Node<E extends Comparable<E>> {
        private E value;
        private Node<E> left,right;

        public Node(E value){
            this.value = value;
        }
    }

    public Node<E> getRoot(){
        return  this.root;
    }

    public Node find(E targetValue){
        return find(root,targetValue);
    }
    public Node find(Node<E> node,E targetValue){
        if(node == null)
            return null;
        Node<E> current = node;
        while(current.value != targetValue){
            int cmp = targetValue.compareTo(current.value);
            if(cmp < 0)
                current = current.left;
            else if(cmp > 0)
                current = current.right;
            else
                return current;
            if(current == null)
                return null;
        }
        return current;
    }

    public void insert(E insertValue){
        Node<E> newNode = new Node<E>(insertValue);

        if(root == null)
            root = newNode;
        else{
            Node<E> current = root;
            Node<E> parent;

            while(true){
                parent = current;
                int cmp = insertValue.compareTo(current.value);
                if(cmp < 0){
                    current = current.left;
                    if(current == null){
                        parent.left = newNode;
                        break;
                    }
                }
                else if(cmp > 0){
                    current = current.right;
                    if(current == null){
                        parent.right = newNode;
                        break;
                    }
                }
                else
                    break;
            }
        }
    }

    public boolean delete(E deleteValue){
        if(root == null)
            return false;

        Node<E> current = root;
        Node<E> parent = current;
        boolean isLeft = false;
        boolean isRight = false;

        while(current.value != deleteValue){//得出要删除的节点是左子节点还是右子节点
            parent = current;
            isLeft = false;
            isRight = false;

            int cmp = deleteValue.compareTo(current.value);

            if(cmp < 0){
                current = current.left;
                isLeft = true;
            }
            else{
                current = current.right;
                isRight = true;
            }

            if(current == null)//不存在要删除的值
                return false;
        }

        if(current.left == null && current.right == null){//删除的节点不存在子节点
            if(isLeft)
                parent.left = null;
            else
                parent.right = null;
            return true;
        }

        else if(current.left != null && current.right == null){//存在左子节点
            if(isLeft)
                parent.left = current.left;
            else
                parent.right = current.left;
            return true;
        }

        else if(current.left == null && current.right != null){//存在右子节点
            if(isLeft)
                parent.left = current.right;
            else
                parent.right = current.right;
            return true;
        }

        else{//左右子节点都存在
            if(isLeft){
                parent.left = current.right;

                Node<E> currentLeft = current.right;
                Node<E> parentLeft = currentLeft;
                while (currentLeft != null){
                    parentLeft = currentLeft;
                    currentLeft = currentLeft.left;
                }
                parentLeft.left = current.left;
                current = null;
            }
            else{
                parent.right = current.left;


                Node<E> currentLeft = current.right;
                Node<E> parentLeft = currentLeft;
                while (currentLeft != null){
                    parentLeft = currentLeft;
                    currentLeft = currentLeft.left;
                }
                parentLeft.left = current.left;
                current = null;
            }
            return true;
        }
    }

    public void preOrder(Node<E> current){//前序遍历
        if(current != null){
            System.out.println(current.value);
            preOrder(current.left);
            preOrder(current.right);
        }
    }

    public void inOrder(Node<E> current){//中序遍历
        if(current != null){
            inOrder(current.left);
            System.out.println(current.value);
            inOrder(current.right);
        }
    }

    public void posOrder(Node<E> current){
        if(current != null){
            posOrder(current.left);
            posOrder(current.right);
            System.out.println(current.value);
        }
    }

    public void preOrder_Unre(Node<E> node){
        if(node != null){
            myStack<Node<E>> stack = new myStack<Node<E>>(512);
            stack.push(node);

            while(!stack.isEmpty()){//先进后出,所以先压右子树
                Node<E> current = stack.pop();
                System.out.println(current.value);

                if(current.right != null)
                    stack.push(current.right);

                if(current.left != null)
                    stack.push(current.left);
            }
        }
    }

    public void inOrder_Unre(Node<E> node){
        if(node != null){
            myStack<Node<E>> stack = new myStack<Node<E>>(512);

            Node<E> current = node;
            while (current != null || !stack.isEmpty()){
                if(current != null){
                    stack.push(current);
                    current = current.left;
                }
                else{
                    current = stack.pop();
                    System.out.println(current.value);
                    current =current.right;
                }
            }
        }
    }

    public void posOrder_Unre(Node<E> node){
        if(node != null){
            myStack<Node<E>> stack = new myStack<Node<E>>(512);

            Node<E> current = node;

            Node<E> pre = current;//标记最近出栈的节点

            while (current != null || !stack.isEmpty()){
                if(current != null){
                    stack.push(current);
                    current = current.left;
                }
                else{
                    current = stack.pop();

                    if(current.right == null || current.right == pre){
                        System.out.println(current.value);
                        pre = current;
                        current = null;
                    }
                    else{
                        stack.push(current);
                        current = current.right;
                        stack.push(current);
                        current = current.left;
                    }
                }
            }
        }
    }

    public void levelOrder(Node<E> node){//层级遍历
        if(node != null){
            myQueue<Node<E>> queue = new myQueue<Node<E>>(512);

            queue.push(node);

            while (!queue.isEmpty()){
                Node<E> current = queue.pop();
                System.out.println(current.value);

                if(current.left != null)
                    queue.push(current.left);

                if(current.right != null)
                    queue.push(current.right);
            }
        }
    }
}
