import { useContext } from "react";
import { DatoContexto } from "../Contexto/DatoContexto";

function CompA() {

    const { user, rol, ciudad } = useContext(DatoContexto);

    return (
        <div className="card">

            <h2>Reto 1 - Datos Compartidos</h2>

            <p>
                <strong>Usuario:</strong> {user}
            </p>

            <p>
                <strong>Rol:</strong> {rol}
            </p>

            <p>
                <strong>Ciudad:</strong> {ciudad}
            </p>

        </div>
    );
}

export default CompA;