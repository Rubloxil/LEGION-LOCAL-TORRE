import Navbar from "./components/Navbar";
import Carousel from "./components/Carousel";
import Login from "./components/Login";
import SearchBar from "./components/SearchBar";
import Card from "./components/Card";


import "./components/Navbar.css";
import "./components/Login.css";
import "./components/Card.css";

function App() {
  return (
    <>
      <Navbar />

      <SearchBar />

      <Carousel />

      <Login />

      

      <div
        style={{
          display: "flex",
          justifyContent: "center",
          gap: "20px",
          marginTop: "30px"
        }}
      >
        <Card
          titulo="Producto 1"
          descripcion="Descripción del producto"
        />

        <Card
          titulo="Producto 2"
          descripcion="Descripción del producto"
        />
      </div>

      
    </>
  );
}

export default App;