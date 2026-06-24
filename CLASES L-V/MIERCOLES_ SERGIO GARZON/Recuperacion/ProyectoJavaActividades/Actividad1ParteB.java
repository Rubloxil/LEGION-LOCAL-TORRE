public class Actividad1ParteB {

    public static void main(String[] args) {

        LibroService libro = new LibroService();
        PrestamoService prestamo = new PrestamoService();
        ReporteService reporte = new ReporteService();

        libro.registrarLibro("Patrones de Diseño");
        prestamo.prestarLibro("Patrones de Diseño");
        reporte.generarReporte();
    }
}