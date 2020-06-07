// import java.util.regex;
import java.io.*;

public class Regex{
	public static void main(String[] args) {
		RegexTest test = new RegexTest();

		test.reader();
		test.fileStreamTest();
	}
}


//正则表达式
//正则表达式定义了字符串的模式。
//正则表达式可以用来搜索、编辑或处理文本。
//正则表达式并不仅限于某一种语言，但是在每种语言中有细微的差别。
//Java正则表达式和Perl的是最为相似的。
//暂略掉
class RegexTest{

	public void reader(){
	  char c;
      // 使用 System.in 创建 BufferedReader 
      BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
      System.out.println("Enter characters, 'q' to quit.");
      // 读取字符
      try{
	      do {
	         c = (char) br.read();
	         System.out.println(c);
	      } while(c != 'q');
      }catch(IOException ex){

      }
      
	}

	public void fileStreamTest(){

		try{

			File f = new File("a.txt");
			FileOutputStream fop = new FileOutputStream(f);
			// 构建FileOutputStream对象,文件不存在会自动新建
			
			OutputStreamWriter writer = new OutputStreamWriter(fop, "UTF-8");
			// 构建OutputStreamWriter对象,参数可以指定编码,默认为操作系统默认编码,windows上是gbk
			
			writer.append("中文输入");
			// 写入到缓冲区
			
			writer.append("\r\n");
			//换行
			
			writer.append("English");
			// 刷新缓存冲,写入到文件,如果下面已经没有写入的内容了,直接close也会写入
			
			writer.close();
			//关闭写入流,同时会把缓冲区内容写入文件,所以上面的注释掉
			
			fop.close();
			// 关闭输出流,释放系统资源

			FileInputStream fip = new FileInputStream(f);
			// 构建FileInputStream对象
			
			InputStreamReader reader = new InputStreamReader(fip, "UTF-8");
			// 构建InputStreamReader对象,编码与写入相同

			StringBuffer sb = new StringBuffer();
			while (reader.ready()) {
				sb.append((char) reader.read());
				// 转成char加到StringBuffer对象中
			}
			System.out.println(sb.toString());
			reader.close();
			// 关闭读取流
			
			fip.close();
			// 关闭输入流,释放系统资源
		}catch(IOException ex){

		}
	}
}

//可变参数
//在方法声明中，在指定参数类型后加一个省略号(...) 。
//一个方法中只能指定一个可变参数，它必须是方法的最后一个参数。
//任何普通的参数必须在它之前声明。
// 使用 BufferedReader 在控制台读取字符


