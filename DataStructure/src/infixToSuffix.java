import java.util.Scanner;

public class infixToSuffix {
    public static boolean containOp(char c){
        if(c == '+'||c == '-'||c == '*'||c == '/'||c == '('||c == ')')
            return true;
        return false;
    }

    public static boolean higherPre(char c,char stackC){
        if(c == '('){
            if(stackC == '(')
                return false;
            else
                return true;
        }
        else if(c == ')')
            return false;
        else if(c == '*'||c == '/'){
            if(stackC != '+'&&stackC != '-' && stackC != ')')
                return false;
            else return true;
        }
        else{
            if(stackC == ')')
                return true;
            else
                return false;
        }
    }

    public static void main(String args[]){//比较运算符优先级
        System.out.print("请输入表达式:");
        Scanner input = new Scanner(System.in);
        char[] str = input.nextLine().toCharArray();
        input.close();

        myQueue<Character> queue = new myQueue<Character>(512);
        myStack<Character> operator = new myStack<Character>(512);

        for(char c:str){
            if(!containOp(c))
                queue.push(c);
            else{
                if(operator.isEmpty())
                    operator.push(c);
                else{
                    char top = operator.pop();
                    if(!higherPre(c,top)){//优先级小于等于
                        if(top == '('){
                            operator.push(top);
                            operator.push(c);
                        }
                        else if(top == ')'){
                            appendTo(queue,top);
                            operator.pop();
                        }
                        else{
                            appendTo(queue,top);
                            popPre(operator,c,queue);
                            operator.push(c);
                        }
                    }
                    else{
                        operator.push(top);
                        operator.push(c);
                    }
                }
            }
        }

        while(!operator.isEmpty()){//最后清空栈内元素
            queue.push(operator.pop());
        }

        char out;
        while(!queue.isEmpty()){
            out = queue.pop();
            if(out != '(' && out != ')')
                System.out.print(out);

        }

    }


    public static void popPre(myStack<Character> op,char c,myQueue<Character> queue){//若比较的运算符优先级小于等于栈顶运算符,递归弹出栈顶元素
        if(!op.isEmpty()){
            char top = op.pop();
            if(!higherPre(c,top)){//优先级小于等于栈顶元素
                appendTo(queue,top);
                popPre(op,c,queue);
            }
            else
                op.push(top);
        }
    }

    public static void appendTo(myQueue<Character> queue,char c){
        if(c != '(' && c != ')')
            queue.push(c);
    }
}
