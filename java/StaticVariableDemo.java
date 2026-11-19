class Counter {
static int count =0;
by all abjects
int Obj Number;
Counter (){
count++;
Obj.number =count;
}
void display (){
System.out.println("Object number = "+objNumber);
System.out.println("static Count ="+count);
System.out.println("---------------------");
}
}
class static variable Demo{
public static void main (string []args){
counter C1= new Counter ();
counter C2= new Counter ();
counter C3= new Counter ();
c1 display ();
c2 display ();
c3 display ();
}
}