
import { createContext } from 'react'
export const DatoContexto = createContext()

export function Proveedor({children}){
  const user='Sergio Garzón'
  const rol='Administrador'
  const ciudad='Bogotá'

  return (
    <DatoContexto.Provider value={{user,rol,ciudad}}>
      {children}
    </DatoContexto.Provider>
  )
}
