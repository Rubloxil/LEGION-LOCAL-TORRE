public class PagoPaypal implements MetodoPago {

    @Override
    public void pagar() {
        System.out.println("Pago realizado con PayPal.");
    }
}