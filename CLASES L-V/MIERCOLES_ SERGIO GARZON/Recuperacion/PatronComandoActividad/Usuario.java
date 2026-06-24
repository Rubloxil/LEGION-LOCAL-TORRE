public class Usuario {

    public static void main(String[] args) {

        Televisor televisor = new Televisor();

        Comando encender = new Encender(televisor);
        Comando apagar = new Apagar(televisor);
        Comando subirVolumen = new SubirVolumen(televisor);

        Comando abrirApp = new AbrirApp(televisor);
        Comando conectarWifi = new ConectarWifi(televisor);
        Comando actualizarFecha = new ActualizarFecha(televisor);

        ControlRemoto control = new ControlRemoto();

        control.setComando(encender);
        control.presionarBoton();

        control.setComando(abrirApp);
        control.presionarBoton();

        control.setComando(conectarWifi);
        control.presionarBoton();

        control.setComando(actualizarFecha);
        control.presionarBoton();

        control.setComando(subirVolumen);
        control.presionarBoton();

        control.setComando(apagar);
        control.presionarBoton();
    }
}