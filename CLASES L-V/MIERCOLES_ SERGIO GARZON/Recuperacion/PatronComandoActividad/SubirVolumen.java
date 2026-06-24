public class SubirVolumen implements Comando {

    private Televisor televisor;

    public SubirVolumen(Televisor televisor) {
        this.televisor = televisor;
    }

    @Override
    public void ejecutar() {
        televisor.subirVolumen();
    }
}