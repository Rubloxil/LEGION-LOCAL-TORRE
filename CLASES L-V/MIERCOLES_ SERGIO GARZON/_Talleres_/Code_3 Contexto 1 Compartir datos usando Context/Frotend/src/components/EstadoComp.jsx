import { useContext } from "react";
import { EstadoContexto } from "../Contexto/EstadoContexto";

function EstadoComp() {

    const { contador, setContador } =
        useContext(EstadoContexto);

    return (
        <div className="card">

            <h2>Reto 2 - Estado Global</h2>

            <p>
                Contador: {contador}
            </p>

            <button
                className="btn"
                onClick={() => setContador(contador + 1)}
            >
                Incrementar
            </button>

        </div>
    );
}

export default EstadoComp;