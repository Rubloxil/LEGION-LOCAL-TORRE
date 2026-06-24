public class BibliotecaSistema {

    public void registrarLibro(String libro) {
        System.out.println("Libro registrado: " + libro);
    }

    public void prestarLibro(String libro) {
        System.out.println("Libro prestado: " + libro);
    }

    public void generarReporte() {
        System.out.println("Reporte generado correctamente.");
    }

    public static void main(String[] args) {

        BibliotecaSistema sistema = new BibliotecaSistema();

        sistema.registrarLibro("Java Básico");
        sistema.prestarLibro("Java Básico");
        sistema.generarReporte();
    }
}