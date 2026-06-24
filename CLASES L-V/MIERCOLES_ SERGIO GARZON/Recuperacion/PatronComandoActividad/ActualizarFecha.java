public class ActualizarFecha implements Comando {

    private Televisor televisor;

    public ActualizarFecha(Televisor televisor) {
        this.televisor = televisor;
    }

    @Override
    public void ejecutar() {
        televisor.actualizarFecha();
    }
}