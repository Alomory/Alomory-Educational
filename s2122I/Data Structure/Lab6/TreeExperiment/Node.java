/*
 * NAME: OMAR ISMAIL ALOMORY
 * PROGRAM: SMSK (KMA) K2
 * COURSE: CSF3013
 * LAB: MP3
 * DATE: 13/12/2022
 */
package TreeExperiment;

import java.util.ArrayList;
import java.util.List;

public class Node<T> {
    private T data =null;

    private List<Node<T>> children = new ArrayList<>();

    private Node<T> parent = null;

    public Node(T data){
        this.data= data;
    }
    public Node<T> addChild(Node<T> child){
        child.setParent(this);
        this.children.add(child);
        return child;
    }
    public void addChildren(List<Node<T>> children){
        children.forEach(each -> each.setParent(this));
        this.children.addAll(children);
    }
    public List<Node<T>> getChildren(){
        return children;
    }
    public T getData(){
        return this.data;
    }

    public void setData(T data){
        this.data = data;
    }
    private void setParent(Node<T> parent){
        this.parent =parent;
    }
    public Node<T> getParent(){
        return this.parent;
    }

    public void printTree(Node<T> root ,String gap){
        if(root == null){
            return;
        }
        
        System.out.println(gap+ root.data);
        for ( Node<T> child : root.children) {
            printTree(child, gap+gap);
        }
    }
}
