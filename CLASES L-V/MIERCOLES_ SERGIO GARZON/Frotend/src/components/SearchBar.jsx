import { useState } from "react";

function SearchBar() {
  const [texto, setTexto] = useState("");

  return (
    <div style={{ textAlign: "center", margin: "20px" }}>
      <input
        type="text"
        placeholder="Buscar..."
        value={texto}
        onChange={(e) => setTexto(e.target.value)}
      />

      <p>Buscando: {texto}</p>
    </div>
  );
}

export default SearchBar;