import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import com.bettinghouse.Person;
import com.bettinghouse.User;
public aspect Logger {
File file = new File("Register.txt");
File file2 = new File("Log.txt");
    Calendar cal;
    User user;
    
    
    pointcut registrarUsuario(User user, Person person): call(* successfulSignUp(User, Person)) && args(user, person);
    
    after(User user, Person person) : registrarUsuario(user, person) {
    this.cal = Calendar.getInstance();
    try(PrintWriter pw=new PrintWriter(new FileOutputStream(file,true))){
    pw.println("Usuario registrado: ["+user+"]    Fecha: ["+cal.getTime() + "]");
    System.out.println("****Usuario ["+user.getNickname()+"] Registrado**** "+cal.getTime());
    }catch(FileNotFoundException e){System.out.println(e.getMessage());}    
    }
    
    pointcut registrarLog() : call(* effectiveLog*(User));
    
    after() : registrarLog() {
    this.cal = Calendar.getInstance();
    try(PrintWriter pw=new PrintWriter(new FileOutputStream(file2,true))){
    pw.println("Log registrado: ["+user+"]    Fecha: ["+cal.getTime() + "]");
    System.out.println("****Usuario ["+user+"] Registrado**** "+cal.getTime());
    }catch(FileNotFoundException e){System.out.println(e.getMessage());}    
    }
}