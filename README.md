# PONG by Fabián Alfonso Beirutti Pérez
Version of Pong using processing.

## Introducción
El objetivo de esta primera práctica de la asignatura de 4to, Creación de Interfaces de Usuario (CIU), es la de diseñar e implementar una versión del conocido juego Pong usando el lenguaje de programación y el IDE llamado Processing. Este permite desarrollar código en diferentes lenguajes y/o modos, como puede ser processing (basado en Java), p5.js (librería de JavaScript), Python, entre otros.
<p align="center"><img src="/pongGif.gif" alt="Pong using processing"></img></p>

**NOTA:** El .gif anterior no es un representación exacta del juego ya que se muestra a una velocidad de reproducción inferior de la normal. 

## Controles
Para permitir que cualquier persona que desee probar el juego pueda hacerlo, se han establecido los siguientes controles:
- **Jugador 1:** Tecla 'W' para moverse hacia arriba y 'S' hacia abajo.
- **Jugador 2:** Tecla 'O' o 'UP' (flecha para arriba) para moverse hacia arriba y 'L' o 'DOWN' (flecha para abajo) hacia abajo.

Como se puede ver, el único requisito es disponer de un ordenador y un teclado. Se ha tenido en cuenta los casos en los que un teclado no disponga de las teclas de dirección (flechas).

## Descripción
Aprovechando que el lenguaje de programación que utiliza el IDE Processing por defecto está basado en Java, podemos desarrollar nuestro código utilizando el paradigma de programación de "Programación Orientada a Objetos". Así pues, hemos descrito tres clases de Java:
- **Pong:** clase principal.
- **Ball:** clase que representa al objeto de la bola/pelota del juego.
- **Player:** clase que representa a cada uno de los dos jugadores del juego.

## Explicación
El código implementado es bastante autoexplicativo, sin embargo, con el objetivo de permitir que cualquier lector sea capaz de entender con perfección el funcionamiento del juego, se explicará a continuación en más detalle la implementación.

### Clase Pong
Aquí es donde inicializamos y definimos todas las variables y librerías que vamos a utilizar a lo largo de toda la implementación.
```java
import processing.sound.*;

Ball ball;

SoundFile score;
SoundFile hit;

Player left;
Player right;

int leftscore = 0;
int rightscore = 0;

boolean menu = true;
```

La clase Pong realiza también,la función del método Main de los lenguajes de programación. Será esta entonces, la que incluya los dos métodos principales de Processing. El primero de ellos, "setup()", nos permite definir y aplicar ciertas variables y valores que serán "estáticos" a lo largo del funcionamiento de la aplicación.

```java
void setup() {
  size(600, 400);
  hit = new SoundFile(this,"hit.wav");
  score = new SoundFile(this,"score.wav");
  ball = new Ball();
  left = new Player(true);
  right = new Player(false);
}
```

Por otra parte, el método "draw()", simula el funcionamiento de un bucle, esto es, que se irá ejecutando vez tras vez al terminar la ejecución del conjunto de comandos/órdenes dentro del mismo, a no ser que se especifique lo contrario. Por defecto, se ejecutará infinitas veces.
Conseguimos así, las dinámicas deseadas, es decir, el efecto de movimiento de la pelota y los jugadores, refrescando constantemente la posición tanto de los jugadores como la pelota.

```java
void draw() {
  if (menu) menu();
  else {
    background(0);
    for(int i=0; i < 800; i+=15) {
      strokeWeight(10);
      stroke(255,255,255);
      line(300,i+5,300,i+5);
    }
    strokeWeight(1);
  
    ball.collisionPlayerRight(right);
    ball.collisionPlayerLeft(left);
  
    left.show();
    right.show();
    left.update();
    right.update();
  
    ball.update();
    ball.edges();
    ball.show();
  
    fill(255);
    textSize(32);
    text(leftscore, 100, 40);
    text(rightscore, width-132, 40);
  }
}
```

Como se puede ver en el fragmento de código anterior, en cada iteración que hace el bucle, dibujamos/representamos por pantalla todos los elementos visuales del juego, actualizando así su valor, forma o posición en la ventana. Lo primero que hacemos es, al iniciar la ejecución del juego, mostrar el menú del juego hasta que usando los métodos que nos permiten controlar los datos/variables de entrada como son la pulsación de las teclas del teclado o el uso del mouse, comienza el juego. Para ello, se implementan y usan los siguientes métodos:
```java
void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if (key == 'w') {
    left.move(-10);
  } else if (key == 's') {
    left.move(10);
  }

  if (key == 'o' || keyCode == UP) {
    right.move(-10);
  } else if (key == 'l' || keyCode == DOWN) {
    right.move(10);
  }
  
  if (keyCode == ENTER) menu = false;
}
```

Por último, para evitar que se solapen o se produzcan errores al reproducir sonidos y/o música, usaremos "thread()", así, se ejecutará como un proceso/hilo aparte de la ejecución principal del juego. Si ponemos en el código:
```java
thread("hit");
thread("score");
```

Estas líneas llamaran a los siguientes métodos que, reproducirán los sonidos correspondientes.

```java
void hit() {
  hit.play();
}

void score() {
  score.play();
}
```

## Descarga y prueba
Para poder probar correctamente el código, es necesario descargar todos los ficheros (los .pde y la carpeta data, esta contiene los archivos de sonido que utiliza el juego) y guardarlo en una carpeta con el mismo nombre que el archivo de la clase principal (Pong). El archivo "README.md" es opcional, si se descarga no debería influir en el funcionamiento de código ya que, es exclusivo de la plataforma GitHub.

## Recursos empleados
Para la realización de esta versión de Pong, se han consultado y/o utilizado los siguientes recursos:
* Guión de prácticas de la asignatura CIU
* <a href="https://processing.org">Página de oficial de Processing y sus referencias y ayudas</a>
* Processing IDE

Por otro lado, las librerías empleadas fueron:
* Sound
* <a href="https://github.com/extrapixel/gif-animation">GifAnimation</a>
