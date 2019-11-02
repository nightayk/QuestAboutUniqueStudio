import java.util.Scanner;

public class BSTtest {
    public static void main(String args[]){
        myBST<Integer> bst = new myBST<Integer>();

        bst.insert(1024);
        bst.insert(233);
        bst.insert(666);
        bst.insert(7588);
        int c;
        Scanner input = new Scanner(System.in);

        while(true) {
            System.out.println("搞事情选项：1~3、前中后序遍历 4～6、它们的非递归遍历 7～10、层级遍历、插入、删除、查找");

            c = input.nextInt();

            if (c == 1) {
                bst.preOrder(bst.getRoot());
            } else if (c == 2) {
                bst.inOrder(bst.getRoot());
            } else if (c == 3) {
                bst.preOrder(bst.getRoot());
            } else if (c == 4) {
                bst.preOrder_Unre(bst.getRoot());
            } else if (c == 5) {
                bst.inOrder_Unre(bst.getRoot());
            } else if (c == 6) {
                bst.posOrder_Unre(bst.getRoot());
            } else if (c == 7) {
                bst.levelOrder(bst.getRoot());
            } else if (c == 8) {
                System.out.print("再输入插入的数值:");
                c = input.nextInt();
                bst.insert(c);
            } else if (c == 9) {
                System.out.print("再输入要删除的数值:");
                c = input.nextInt();
                bst.delete(c);
            } else if (c == 10) {
                System.out.print("再输入要查找的数值");
                c = input.nextInt();
                if (bst.find(c) != null)
                    System.out.println("找到了");
                else
                    System.out.println("没找到");
            }
        }

    }
}
