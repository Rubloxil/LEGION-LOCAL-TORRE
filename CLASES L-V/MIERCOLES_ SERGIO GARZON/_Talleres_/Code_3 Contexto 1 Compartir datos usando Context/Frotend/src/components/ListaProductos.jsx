import { useContext } from "react";
import { EstadoContexto } from "../Contexto/EstadoContexto";

function ListaProductos() {

    const { productos } =
        useContext(EstadoContexto);

    return (
        <div className="card">

            <h2>Reto 3 - Lista Compartida</h2>

            <ul className="product-list">

                {productos.map((producto) => (
                    <li key={producto.id}>
                        {producto.nombre}
                    </li>
                ))}

            </ul>

        </div>
    );
}

export default ListaProductos;