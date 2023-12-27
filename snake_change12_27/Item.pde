void drawItem()
{
  // 食物的顏色
  fill(#0DD86D);

  // 如果被吃了，就再隨機生產一個
  if (foodKey) {
    // 產生隨機座標，直到它不在障礙物、星星和蛇的身體上
  }

  rect(itemX, itemY, w, 30);
  foodKey = false;
}
