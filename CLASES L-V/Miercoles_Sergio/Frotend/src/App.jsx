import { BrowserRouter, Routes, Route } from "react-router-dom";

import Navbar from "./components/Navbar";
import Inicio from "./components/Inicio";
import Productos from "./components/Productos";
import Contacto from "./components/Contacto";
import { BrowserRouter } from "react-router-dom";

function App() {
  return (
    <>
      <Navbar />

      <div style={{ padding: "20px" }}>
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<Inicio />} />
            <Route path="/productos" element={<Productos />} />
            <Route path="/contacto" element={<Contacto />} />
          </Routes>
        </BrowserRouter>
      </div>
    </>
  );
}

export default App;