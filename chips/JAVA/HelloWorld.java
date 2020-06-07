public class HelloWorld{
	public static void main(String []args){
		System.out.println("Hello world");
	} 
}

class Dog{
	String breed;
	int age;
	String color;
	void barking(){}
	void hungry(){}
	void sleeping(){}
}

/*
Java中的类
一个类可以包含以下类型变量：
局部变量：在方法、构造方法或者语句块中定义的变量被称为局部变量。变量声明和初始化都是在方法中，方法结束后，变量就会自动销毁。
成员变量：成员变量是定义在类中，方法体之外的变量。这种变量在创建对象的时候实例化。成员变量可以被类中方法、构造方法和特定类的语句块访问。
类变量：类变量也声明在类中，方法体之外，但必须声明为static类型。
*/

class Puppy{
	public Puppy(){}
	public Puppy(String  name){
		System.out.println("Passed Name is:"+name);
	}

	int puppyAge;
	public void setAge(int age){
		puppyAge = age;
	}
	public int getAge(){
		System.out.println("Puppy's age is :"+puppyAge);
		return puppyAge;
	}

	public static void main(String[] args) {
		Puppy myPuppy = new Puppy("tommy");
		myPuppy.setAge(2);
		myPuppy.getAge();
		System.out.println("Variable Value is:",myPuppy.puppyAge);
	}
}
/*
构造方法
每个类都有构造方法。如果没有显式地为类定义构造方法，Java编译器将会为该类提供一个默认构造方法。
在创建一个对象的时候，至少要调用一个构造方法。构造方法的名称必须与类同名，一个类可以有多个构造方法。
*/

/*
源文件声明规则
在本节的最后部分，我们将学习源文件的声明规则。
当在一个源文件中定义多个类，并且还有import语句和package语句时，要特别注意这些规则。
一个源文件中只能有一个public类
一个源文件可以有多个非public类
源文件的名称应该和public类的类名保持一致。
例如：源文件中public类的类名是Employee，那么源文件应该命名为Employee.java。
如果一个类定义在某个包中，那么package语句应该在源文件的首行。
如果源文件包含import语句，那么应该放在package语句和类定义之间。
如果没有package语句，那么import语句应该在源文件中最前面。
import语句和package语句对源文件中定义的所有类都有效。在同一源文件中，不能给不同的类不同的包声明。
类有若干种访问级别，并且类也分不同的类型：抽象类和final类等。这些将在访问控制章节介绍。
除了上面提到的几种类型，Java还有一些特殊的类，如：内部类、匿名类。
*/

final double PI = 3.1415927;
//在 Java 中使用 final 关键字来修饰常量，声明方式和变量类似：
//虽然常量名也可以用小写，但为了便于识别，通常使用大写字母表示常量。

public synchronized void showDetails(){

} 
//Synchronized关键字声明的方法同一时间只能被一个线程访问。

public transient int limit = 55;   // will not persist
public int b; // will persist
//序列化的对象包含被transient修饰的实例变量时，java虚拟机(JVM)跳过该特定的变量。
//该修饰符包含在定义变量的语句中，用来预处理类和变量的数据类型。


public class MyRunnable implements Runnable
{
    private volatile boolean active;
    public void run()
    {
        active = true;
        while (active) // 第一行
        {
            // 代码
        }
    }
    public void stop()
    {
        active = false; // 第二行
    }
}
/*
Volatile 修饰的成员变量在每次被线程访问时，都强制从共享内存中重新读取该成员变量的值。
而且，当成员变量发生变化时，会强制线程将变化值回写到共享内存。
这样在任何时刻，两个不同的线程总是看到某个成员变量的同一个值。
一个volatile对象引用可能是null。
*/