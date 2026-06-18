
import { createContext, useState } from 'react'
export const EstadoContexto = createContext()

export function EstadoProveedor({children}){
  const [contador,setContador] = useState(0)

  const productos = [
    {id:1,nombre:'Mouse'},
    {id:2,nombre:'Teclado'},
    {id:3,nombre:'Monitor'}
  ]

  return (
    <EstadoContexto.Provider value={{contador,setContador,productos}}>
      {children}
    </EstadoContexto.Provider>
  )
}
