public class PagoTransferencia implements MetodoPago {

    @Override
    public void pagar() {
        System.out.println("Pago realizado por transferencia.");
    }
}