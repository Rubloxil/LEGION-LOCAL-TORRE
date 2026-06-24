public class PedidoServiceAlto {

    public void confirmarPedido() {

        EmailService email = new EmailService();
        email.enviarCorreo();
    }

    public static void main(String[] args) {

        PedidoServiceAlto pedido = new PedidoServiceAlto();
        pedido.confirmarPedido();
    }
}