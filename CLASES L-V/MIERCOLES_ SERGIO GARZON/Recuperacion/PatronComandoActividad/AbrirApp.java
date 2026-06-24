public class AbrirApp implements Comando {

    private Televisor televisor;

    public AbrirApp(Televisor televisor) {
        this.televisor = televisor;
    }

    @Override
    public void ejecutar() {
        televisor.abrirApp();
    }
}