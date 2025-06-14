//video explicativo
//https://youtube.com/shorts/SX9CA240iMU?si=wYQq3XdOm_7b4tL4
//Ricardo Axson

int cols = 12;
int rows = 12;
float cellSize = 50;
boolean curva = true;

void setup() {
  size(800, 400);
  noStroke();
}

void draw() {
  background(255);
  
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
      float posX = x * cellSize;
      float posY = y * cellSize;
      
      // Distorsión según el mouse
      float offsetX = curva ? sin(map(posY, 0, height, 0, PI)) * calcularDistorsion(posX, posY) : 0;
      float offsetY = curva ? cos(map(posX, 0, width, 0, PI)) * calcularDistorsion(posX, posY) : 0;
      
      dibujarCelda(posX + offsetX, posY + offsetY, x, y);
    }
  }
}

// ✅ Función que NO retorna
void dibujarCelda(float x, float y, int i, int j) {
  if ((i + j) % 2 == 0) {
    fill(0);
  } else {
    fill(255);
  }
  rect(x, y, cellSize, cellSize);
}

// ✅ Función que SÍ retorna
float calcularDistorsion(float x, float y) {
  float d = dist(x, y, mouseX, mouseY);
  return map(d, 0, width, 10, -10);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    cols = int(random(8, 16));
    rows = cols;
    cellSize = width / cols;
  }
  if (key == 'c' || key == 'C') {
    curva = !curva;
  }
}
