import { useState } from "react";

function Login() {
  const [usuario, setUsuario] = useState("");

  const ingresar = () => {
    alert(`Bienvenido ${usuario}`);
  };

  return (
    <div className="login">
      <h2>Iniciar Sesión</h2>

      <input
        type="text"
        placeholder="Usuario"
        onChange={(e) => setUsuario(e.target.value)}
      />

      <input
        type="password"
        placeholder="Contraseña"
      />

      <button onClick={ingresar}>
        Ingresar
      </button>
    </div>
  );
}

export default Login;