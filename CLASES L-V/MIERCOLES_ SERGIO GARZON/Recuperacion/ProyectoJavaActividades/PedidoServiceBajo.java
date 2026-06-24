public class PedidoServiceBajo {

    private Notificacion notificacion;

    public PedidoServiceBajo(Notificacion notificacion) {
        this.notificacion = notificacion;
    }

    public void confirmarPedido() {
        notificacion.enviar();
    }

    public static void main(String[] args) {

        Notificacion email = new EmailServiceBajo();

        PedidoServiceBajo pedido = new PedidoServiceBajo(email);
        pedido.confirmarPedido();
    }
}