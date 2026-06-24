import Carousel from "./Carousel";

function Inicio() {
  return (
    <div>
      <h1>Bienvenido a la tienda</h1>

      {/* Carousel solo en Home */}
      <Carousel />
    </div>
  );
}
console.log("Inicio renderizado");

export default Inicio;