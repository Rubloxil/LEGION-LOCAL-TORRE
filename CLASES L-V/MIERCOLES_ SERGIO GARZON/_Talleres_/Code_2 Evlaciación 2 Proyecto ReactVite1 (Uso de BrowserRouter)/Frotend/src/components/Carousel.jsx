import { useState } from "react";
import "./Carousel.css";

function Carousel() {
  const imagenes = [
    "https://picsum.photos/id/10/800/400",
    "https://picsum.photos/id/20/800/400",
    "https://picsum.photos/id/30/800/400",
  ];

  const [indice, setIndice] = useState(0);

  const siguiente = () => {
    setIndice((indice + 1) % imagenes.length);
  };

  const anterior = () => {
    setIndice(
      indice === 0
        ? imagenes.length - 1
        : indice - 1
    );
  };

  return (
    <div className="carousel">
      <button onClick={anterior}>◀</button>

      <img
        src={imagenes[indice]}
        alt="Imagen"
      />

      <button onClick={siguiente}>▶</button>
    </div>
  );
}

export default Carousel;