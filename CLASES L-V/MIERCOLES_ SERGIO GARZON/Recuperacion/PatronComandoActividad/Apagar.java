public class Apagar implements Comando {

    private Televisor televisor;

    public Apagar(Televisor televisor) {
        this.televisor = televisor;
    }

    @Override
    public void ejecutar() {
        televisor.apagar();
    }
}