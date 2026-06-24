public class PagoServiceBueno {

    private MetodoPago metodoPago;

    public PagoServiceBueno(MetodoPago metodoPago) {
        this.metodoPago = metodoPago;
    }

    public void procesarPago() {
        metodoPago.pagar();
    }

    public static void main(String[] args) {

        MetodoPago pago = new PagoPaypal();

        PagoServiceBueno servicio = new PagoServiceBueno(pago);
        servicio.procesarPago();
    }
}