public class PagoTarjeta implements MetodoPago {

    @Override
    public void pagar() {
        System.out.println("Pago realizado con tarjeta.");
    }
}