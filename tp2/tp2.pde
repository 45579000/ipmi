PImage[] imagenes = new PImage[3];
int indiceImagen = 0;
float X = 0;
float velocidad = 2;

void setup() {
  size(640, 480);
  imagenes[0] =
  loadImage("musica1.jpg");
  imagenes[1] =
  loadImage("musica2.jpg");
  imagenes[2] =
  loadImage("musica3.jpg");
}

void draw() {
  image(imagenes[indiceImagen], 0, 0, width, height);
  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("El primer aeropuerto operativo de la historia fue el de Collage Park Airport", X, height/2);
  text("Se construyó en agosto de 1909 por el ejército de los Estados Unidos", X, height/3);
  
  X += velocidad;
  if (X > width || X < 0) {
    velocidad *= -1;
  }
  
  if (frameCount % 300 == 0) {
    indiceImagen = (indiceImagen + 1) % 3;
  }
}

void mousePressed() {
  indiceImagen = 0;
  X = 0;
}
