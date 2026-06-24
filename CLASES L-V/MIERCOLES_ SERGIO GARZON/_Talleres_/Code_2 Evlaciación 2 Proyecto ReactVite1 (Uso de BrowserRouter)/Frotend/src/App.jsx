import { Routes, Route } from "react-router-dom";

import Navbar from "./components/Navbar";
import Inicio from "./components/Inicio";
import Productos from "./components/Productos";
import Contacto from "./components/Contacto";
import Login from "./components/Login";

function App() {
  return (
    <>
      <Navbar />

      <div style={{ padding: "20px" }}>
        <Routes>
          <Route path="/" element={<Inicio />} />
          <Route path="/productos" element={<Productos />} />
          <Route path="/contacto" element={<Contacto />} />
          <Route path="/login" element={<Login />} />
        </Routes>
      </div>
    </>
  );
}

export default App;