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
          titulo="GATOMAN"
          descripcion="Es un gato con corbata y parece ser humano pero es un gato"
        />

        <Card
          titulo="POSIGATO"
          descripcion="Es un posillo en forma de gato y en un posillo yt no un gato "
        />
      </div>

      
    </>
  );
}

export default App;