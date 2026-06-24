import { Link } from "react-router-dom";
import "./Navbar.css";

function Navbar() {
  return (
    <nav className="navbar">
      <h2 className="logo">Mi Tienda</h2>

      <div className="menu">
        <Link to="/">Inicio</Link>
        <Link to="/productos">Productos</Link>
        <Link to="/contacto">Contacto</Link>
        <Link to="/login">Login</Link>
      </div>
    </nav>
  );
}

export default Navbar;