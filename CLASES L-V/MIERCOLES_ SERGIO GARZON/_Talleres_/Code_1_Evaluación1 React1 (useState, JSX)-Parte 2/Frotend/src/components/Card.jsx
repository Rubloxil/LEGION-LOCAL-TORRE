function Card({ titulo, descripcion }) {
  return (
    <div className="card">
      <h3>{titulo}</h3>

      <p>{descripcion}</p>

      <button>Ver Más</button>
    </div>
  );
}

export default Card;