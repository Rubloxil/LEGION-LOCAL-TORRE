
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import { Proveedor } from './Contexto/DatoContexto'
import { EstadoProveedor } from './Contexto/EstadoContexto'
import './Styles/global.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <Proveedor>
    <EstadoProveedor>
      <App />
    </EstadoProveedor>
  </Proveedor>
)
