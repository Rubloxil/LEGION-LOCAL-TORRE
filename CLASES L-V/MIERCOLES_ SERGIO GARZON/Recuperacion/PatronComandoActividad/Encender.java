public class Encender implements Comando {

    private Televisor televisor;

    public Encender(Televisor televisor) {
        this.televisor = televisor;
    }

    @Override
    public void ejecutar() {
        televisor.encender();
    }
}