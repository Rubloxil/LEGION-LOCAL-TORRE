import CompA from "./components/CompA";
import EstadoComp from "./components/EstadoComp";
import ListaProductos from "./components/ListaProductos";

function App() {
  return (
    <div className="container">

      <h1 className="title">
        Taller Context API React
      </h1>

      <CompA />
      <EstadoComp />
      <ListaProductos />

      <footer className="footer">
        Context API - React Vite
      </footer>

    </div>
  );
}

export default App;