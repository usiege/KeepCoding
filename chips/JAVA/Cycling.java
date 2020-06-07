import java.util.Date;

public class Cycling{
	public static void main(String[] args) {

		Test test = new Test();
		test.customFor();
		test.customWhile();
		test.enhanceFor();

		test.mutableString();
		test.array();
		test.date();


		System.out.println("testing is end!");
	}	
}

class CyclingTest{

	public void customWhile(){
		System.out.print("custoom while:\n");
		int x = 10;
		while(x <20){
			System.out.print("value of x:" + x);
			x++;
			System.out.print("\n");
		}
	}

	public void customFor(){
		System.out.print("custom for:\n");
		for (int x = 0; x < 20; x++) {
			System.out.print("value of x:" + x);
			System.out.print("\n");	
		}
	}

	public void enhanceFor(){
		System.out.print("enhance for:\n");	

		int [] numbers = {10, 20, 30, 40, 50};
        for(int x : numbers ){
         	System.out.print( x );
         	System.out.print(",");
      	}
      	System.out.print("\n");
      	String [] names ={"James", "Larry", "Tom", "Lacy"};
      	for( String name : names ) {
         	System.out.print( name );
         	System.out.println(",");
      	}
	}

//String

	//当对字符串进行修改的时候，需要使用StringBuffer和StringBuilder类。
	//和String类不同的是，StringBuffer和StringBuilder类的对象能够被多次的修改，
	//并且不产生新的未使用对象。StringBuilder类在Java 5中被提出，
	//它和StringBuffer之间的最大不同在于StringBuilder的方法不是线程安全的（不能同步访问）。
	//由于StringBuilder相较于StringBuffer有速度优势，所以多数情况下建议使用StringBuilder类。
	//然而在应用程序要求线程安全的情况下，则必须使用StringBuffer类。

	public void mutableString(){
		System.out.print("mutable String:\n");	
		StringBuffer sBuffer = new StringBuffer("test ");
		sBuffer.append("String buffer");
		System.out.println(sBuffer);
	}

//数组

	public void array(){
		System.out.print("array :\n");	
		double[] myList = new double[10];
		for (int i=0;i < 10;i++ ) {
			myList[i] = i;
			System.out.print(myList[i]+"\\");	
		}
		System.out.println(myList);
	}

//日期时间

	public void date(){
		System.out.print("date :\n");	
		Date date = new Date();
		System.out.println(date.toString());
	}
}







