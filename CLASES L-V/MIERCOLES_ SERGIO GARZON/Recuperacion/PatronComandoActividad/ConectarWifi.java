public class ConectarWifi implements Comando {

    private Televisor televisor;

    public ConectarWifi(Televisor televisor) {
        this.televisor = televisor;
    }

    @Override
    public void ejecutar() {
        televisor.conectarWifi();
    }
}