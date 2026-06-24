public class PagoServiceMalo {

    public void procesarPago(String tipoPago) {

        if(tipoPago.equals("tarjeta")) {
            System.out.println("Pago realizado con tarjeta.");
        } else if(tipoPago.equals("paypal")) {
            System.out.println("Pago realizado con PayPal.");
        } else if(tipoPago.equals("transferencia")) {
            System.out.println("Pago realizado por transferencia.");
        }
    }

    public static void main(String[] args) {

        PagoServiceMalo pago = new PagoServiceMalo();
        pago.procesarPago("paypal");
    }
}