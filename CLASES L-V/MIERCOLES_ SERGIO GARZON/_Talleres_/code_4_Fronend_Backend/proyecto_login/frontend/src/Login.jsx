// PASO 9: Componente React — Formulario de Login
// Archivo: src/Login.jsx
//
// Envía las credenciales al endpoint /login del backend FastAPI
// y muestra el resultado al usuario.

import { useState } from "react";

function Login() {
  const [usuario, setUsuario] = useState("");
  const [password, setPassword] = useState("");
  const [mensaje, setMensaje] = useState("");
  const [error, setError] = useState("");
  const [cargando, setCargando] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMensaje("");
    setError("");
    setCargando(true);

    try {
      const respuesta = await fetch("http://127.0.0.1:8000/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ usuario, password }),
      });

      const datos = await respuesta.json();

      if (respuesta.ok) {
        setMensaje(`✅ ${datos.mensaje} — Bienvenido, ${datos.usuario}!`);
      } else {
        setError(`❌ ${datos.detail}`);
      }
    } catch (err) {
      print(err)
      setError("❌ No se pudo conectar con el servidor. ¿Está corriendo FastAPI?");
    } finally {
      setCargando(false);
    }
  };

  return (
    <div style={estilos.contenedor}>
      <div style={estilos.tarjeta}>
        <h2 style={estilos.titulo}>Iniciar Sesión</h2>

        <form onSubmit={handleSubmit} style={estilos.formulario}>
          <div style={estilos.campo}>
            <label style={estilos.etiqueta}>Usuario</label>
            <input
              type="text"
              value={usuario}
              onChange={(e) => setUsuario(e.target.value)}
              placeholder="Ingresa tu usuario"
              required
              style={estilos.input}
            />
          </div>

          <div style={estilos.campo}>
            <label style={estilos.etiqueta}>Contraseña</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Ingresa tu contraseña"
              required
              style={estilos.input}
            />
          </div>

          <button
            type="submit"
            disabled={cargando}
            style={{
              ...estilos.boton,
              opacity: cargando ? 0.7 : 1,
              cursor: cargando ? "not-allowed" : "pointer",
            }}
          >
            {cargando ? "Verificando..." : "Ingresar"}
          </button>
        </form>

        {mensaje && <p style={estilos.exito}>{mensaje}</p>}
        {error && <p style={estilos.errorMensaje}>{error}</p>}
      </div>
    </div>
  );
}

const estilos = {
  contenedor: {
    minHeight: "100vh",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    background: "#f0f4f8",
    fontFamily: "'Segoe UI', sans-serif",
  },
  tarjeta: {
    background: "#ffffff",
    padding: "40px",
    borderRadius: "12px",
    boxShadow: "0 4px 20px rgba(0,0,0,0.1)",
    width: "360px",
  },
  titulo: {
    textAlign: "center",
    marginBottom: "28px",
    color: "#1a202c",
    fontSize: "24px",
    fontWeight: "700",
  },
  formulario: {
    display: "flex",
    flexDirection: "column",
    gap: "16px",
  },
  campo: {
    display: "flex",
    flexDirection: "column",
    gap: "6px",
  },
  etiqueta: {
    fontSize: "14px",
    fontWeight: "600",
    color: "#4a5568",
  },
  input: {
    padding: "10px 14px",
    borderRadius: "8px",
    border: "1px solid #cbd5e0",
    fontSize: "15px",
    outline: "none",
    transition: "border-color 0.2s",
  },
  boton: {
    marginTop: "8px",
    padding: "12px",
    background: "#3182ce",
    color: "#fff",
    border: "none",
    borderRadius: "8px",
    fontSize: "16px",
    fontWeight: "600",
    transition: "background 0.2s",
  },
  exito: {
    marginTop: "16px",
    color: "#276749",
    background: "#f0fff4",
    border: "1px solid #9ae6b4",
    borderRadius: "8px",
    padding: "10px 14px",
    fontSize: "14px",
  },
  errorMensaje: {
    marginTop: "16px",
    color: "#742a2a",
    background: "#fff5f5",
    border: "1px solid #feb2b2",
    borderRadius: "8px",
    padding: "10px 14px",
    fontSize: "14px",
  },
};

export default Login;
