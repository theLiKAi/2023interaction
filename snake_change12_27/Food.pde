// 畫個食物
void drawFood(int maxWidth, int maxHeight) {
  // 食物的顏色
  fill(#ED1818);

  // 如果被吃了，就再隨機生產一個
  if (foodKey) {
    // 產生隨機座標，直到它不在障礙物、星星和蛇的身體上
    do {
      foodX = int(random(2, maxWidth / w - 3)) * w;
      foodY = int(random(2, maxHeight / h - 3)) * h;
    } while (checkCollision(foodX, foodY));
  }

  rect(foodX, foodY, w, h);
  foodKey = false;
}
