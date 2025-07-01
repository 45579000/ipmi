import ddf.minim.*;

PImage[] galaxias = new PImage[4];
String[] textos = {
  "Somos polvo de estrellas, fragmentos del cosmos",
  "Cada átomo que ves fue creado en una supernova",
  "En la inmensidad del universo, brillamos juntos",
  "Las galaxias cuentan historias de luz y tiempo"
};

int indiceImagen = 0;
int duracion = 10000; // 10 segundos
int tiempoAnterior;

float textoX;
float textoVelX = 1.5f;
float textoMinX, textoMaxX;

boolean cicloActivo = false;
boolean presentacionIniciada = false;

// Botón
int botonX, botonY, botonRadio;

// Minim y audio
Minim minim;
AudioPlayer musica;

void setup() {
  size(640, 480);
  textSize(24);
  textAlign(CENTER, CENTER);
  fill(255);

  galaxias[0] = loadImage("Galaxia 1.jpg");
  galaxias[1] = loadImage("Galaxia 2.jpg");
  galaxias[2] = loadImage("Galaxia 3.jpg");
  galaxias[3] = loadImage("Galaxia 4.jpg");

  for (int i = 0; i < galaxias.length; i++) {
    if (galaxias[i] == null) {
      println("No se pudo cargar la imagen: Galaxia " + (i+1) + ".jpg");
    }
  }

  tiempoAnterior = millis();
  textoX = width / 2;
  textoMinX = 100;
  textoMaxX = width - 100;

  botonX = width / 2;
  botonY = height - 100;
  botonRadio = 60;

  // Inicializar Minim y cargar audio
  minim = new Minim(this);
  musica = minim.loadFile("mk3.mp3");
}

void draw() {
  background(0);

  if (!presentacionIniciada) {
    // Pantalla de introducción
    fill(255);
    textSize(26);
    text("Vamos a hablar del polvo de estrellas", width / 2, height / 3);
    textSize(22);
    text("¿Quieres saber sobre el tema?", width / 2, height / 3 + 50);

    // Botón
    fill(255, 100);
    ellipse(botonX, botonY, botonRadio * 2, botonRadio * 2);

    fill(255);
    textSize(16);
    text("Da click aquí y te hablaré\nqué es el polvo de estrellas", botonX, botonY);
    textSize(24); // restaurar tamaño
  } else {
    // Mostrar imagen de galaxia
    if (galaxias[indiceImagen] != null) {
      image(galaxias[indiceImagen], 0, 0, width, height);
    } else {
      fill(255, 0, 0);
      text("Imagen no disponible:\nGalaxia " + (indiceImagen+1) + ".jpg", width/2, height/2);
    }

    // Animación de texto
    textoX += textoVelX;
    if (textoX > textoMaxX || textoX < textoMinX) {
      textoVelX *= -1;
    }

    fill(0, 150);
    text(textos[indiceImagen], textoX + 2, height - 50 + 2);
    fill(255);
    text(textos[indiceImagen], textoX, height - 50);

    // Cambio automático
    if (cicloActivo && millis() - tiempoAnterior > duracion) {
      indiceImagen++;
      if (indiceImagen >= galaxias.length) {
        indiceImagen = galaxias.length - 1;
        cicloActivo = false;

        // Pausar música al final si querés (opcional)
        // musica.pause();
      }
      tiempoAnterior = millis();
    }

    // Botón de reinicio al final
    if (!cicloActivo && indiceImagen == galaxias.length - 1) {
      fill(255, 100);
      ellipse(botonX, botonY, botonRadio * 2, botonRadio * 2);
      fill(255);
      textSize(18);
      text("¿Quieres reiniciar?\nHaz clic aquí", botonX, botonY);
      textSize(24);
    }
  }
}

void mousePressed() {
  float d = dist(mouseX, mouseY, botonX, botonY);
  
  if (!presentacionIniciada && d < botonRadio) {
    presentacionIniciada = true;
    cicloActivo = true;
    tiempoAnterior = millis();
    indiceImagen = 0;
    
    // Empezar música desde el inicio
    musica.rewind();
    musica.play();
  } 
  else if (!cicloActivo && presentacionIniciada && d < botonRadio) {
    // Reinicio después de la última galaxia
    indiceImagen = 0;
    cicloActivo = true;
    tiempoAnterior = millis();
    
    // Reiniciar música
    musica.rewind();
    musica.play();
  }
}

// Para liberar recursos cuando cierres el sketch
void stop() {
  musica.close();
  minim.stop();
  super.stop();
}
