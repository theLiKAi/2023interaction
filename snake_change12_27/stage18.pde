class SnakeNPC {
  int x, y;
  int speed = int(random(1,10));
  int direction;
  boolean ateFood = false;
  ArrayList<int[]> body; // 追蹤身體的數組

  SnakeNPC(int initialX, int initialY) {
    x = initialX ;
    y = initialY ;
    direction = int(random(4));
    body = new ArrayList<int[]>();
    body.add(new int[] {x, y}); // 初始身體
  }
  void update() {
    if (change) {
      // 計算蛇頭到食物的方向
      int targetDirection = calculateDirectionToFood();
      
      // 如果有找到有效的方向，就使用它
      if (targetDirection != -1) {
        direction = targetDirection;
      }
      if (direction == 0) {
        y -= speed;
      } else if (direction == 1) {
        x += speed;
      } else if (direction == 2) {
        y += speed;
      } else if (direction == 3) {
        x -= speed;
      }
      updateBody();
    }
  }
   int calculateDirectionToFood() {
    float targetX = snakeHeadX - x;
    float targetY = snakeHeadY - y;
    
    // 以較大的方向為主
    if (abs(targetX) > abs(targetY)) {
      // 左右方向
      return (targetX > 0) ? 1 : 3;
    } else {
      // 上下方向
      return (targetY > 0) ? 2 : 0;
    }
  }

  void updateBody() {
    // 更新身體的位置
    int[] newBodyPart = {x, y};
    body.add(0, newBodyPart);

    // 如果沒有吃到食物，則刪除最後一個身體部分
    if (!ateFood && body.size() > 1) {
      body.remove(body.size() - 1);
    }
  }

  void checkCollision() {
    if (x >= width || x < 0 || y >= height || y < 0) {
      // 撞牆，隨機生成新方向
      changeRandomDirection();
    }
  }

  void changeRandomDirection() {
    int newDirection;
    do {
      newDirection = int(random(4));  // 隨機選擇新方向
    } while (newDirection == (direction + 2) % 4);  // 避免直接往回走
    direction = newDirection;
  }

  void display() {
    // 顯示 NPC 蛇的身體
    fill(0, 255, 0);
    for (int[] part : body) {
      rect(part[0], part[1], 15, 15);
    }
  }


}

SnakeNPC snakeNPC;
