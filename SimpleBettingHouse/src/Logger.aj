public aspect Logger {

    pointcut success() : execute(* successfulSignUp(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje despus de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
}