//PERSONAJES
object neo {
    var energia = 100 //Cuando salta pierde la mitad de su energia
    
    method esElElegido() = true
    method saltar() {energia = energia.div(2)}
    method vitalidad() = energia.div(10)
}

object morfeo {
    var vitalidad = 8
    var descansado = true

    method vitalidad() = vitalidad
    method saltar() {
        if(descansado) {
            descansado = !descansado
            vitalidad = vitalidad - 1
        } else {
            descansado = true
            vitalidad = vitalidad - 1
        }
    }
    method esElElegido() = false
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {}
}

//NAVE  
object nave {
    const pasajeros = #{}

    method abordar(personaje) { pasajeros.add(personaje) }
    method abandonar(personaje) { pasajeros.remove(personaje) }
    method chocar() { pasajeros.clear() }
    method cantidadDePasajeros() = pasajeros.size()
    method pasajeroConMasVitalidad() = pasajeros.max({p => p.vitalidad()})
    method estaEquilibrada() = pasajeros.all({p => p.vitalidad() < p.vitalidad() * 2})
    method elElegidoEstaABordo() = pasajeros.any({p => p.esElElegido()})
    method acelerar() {pasajeros.forEach({p => if(!p.esElElegido()) p.saltar()})}
}