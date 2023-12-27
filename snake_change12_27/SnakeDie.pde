boolean isSnakeDie() {
    // 撞墙了
    if ( snakeHeadX < 15 || snakeHeadX >= 585 || snakeHeadY < 30 || snakeHeadY >= 570) {
      showGameOver();
      return true;
    }

    // 自己吃自己
    if ( snakeLength > 2 ) {
      for ( int i=1; i<snakeLength; i++ ) {
        if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
          showGameOver();
          return true;
        }
      }
    }
    if (checkObstacleCollision()) {
      showGameOver();
      return true;
    }
    if ( rego==0) {
      showGameOver();
      return true;
    }

    return false;
  }

  // 蛇死了麼？
  boolean isSnakeDie2() {
    // 撞墙了
    if ( snakeHeadX <-1000 || snakeHeadX >= 600 || snakeHeadY <270 || snakeHeadY > 315) {
      showGameOver();
      return true;
    }

    // 自己吃自己
    if ( snakeLength > 2 ) {
      for ( int i=1; i<snakeLength; i++ ) {
        if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
          showGameOver();
          return true;
        }
      }
    }
    if (checkObstacleCollision()) {
      showGameOver();
      return true;
    }
    if ( rego==0) {
      showGameOver();
      return true;
    }
    return false;
  }
  // 蛇死了麼？
  boolean isSnakeDie3() {
     if ((snakeX + 25 > obstacleX && snakeX < obstacleX + obstacleWidth && snakeY + 25 > groundLevel - obstacleHeight) ||
      (snakeX + 25 > highObstacleX && snakeX < highObstacleX + highObstacleWidth && snakeY + 25 > groundLevel - highObstacleHeight)) {
    showGameOver();
      return true;
  }
    return false;
  }
  boolean isSnakeDie4() {
    // 撞墙了
    if ( snakeHeadX < -30 || snakeHeadX >= 600 || snakeHeadY < 30 || snakeHeadY >= 570) {
      showGameOver();
      return true;
    }
    if ( snakeHeadX > 150 && snakeHeadX< 450 && snakeHeadY > 150 && snakeHeadY < 450) {
      showGameOver();
      return true;
    }
    // 自己吃自己
    if ( snakeLength > 2 ) {
      for ( int i=1; i<snakeLength; i++ ) {
        if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
          showGameOver();
          return true;
        }
      }
    }
    if (checkObstacleCollision()) {
      showGameOver();
      return true;
    }
    if ( rego==0) {
      showGameOver();
      return true;
    }

    return false;
  }
  boolean isSnakeDie5() {
    // 撞墙了
      for (SnakeNPC currentSnake : snakeNPCs) {
    if (dist(currentSnake.x, currentSnake.y, snakeHeadX, snakeHeadY) <15) {
      showGameOver();
      return true;
    }
  }
   if ( snakeHeadX < -30 || snakeHeadX >= 600 || snakeHeadY < 30 || snakeHeadY >= 570) {
      showGameOver();
      return true;
    }
    // 自己吃自己
    if ( snakeLength > 2 ) {
      for ( int i=1; i<snakeLength; i++ ) {
        if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
          showGameOver();
          return true;
        }
      }
    }
    if (checkObstacleCollision()) {
      showGameOver();
      return true;
    }
    if ( rego==0) {
      showGameOver();
      return true;
    }

    return false;
  }
  boolean isSnakeDie6() {
    // 撞墙了
   if ( snakeHeadX < -30 || snakeHeadX >= 600 || snakeHeadY < 30 || snakeHeadY >= 570) {
      showGameOver();
      return true;
    }
    // 自己吃自己
    if ( snakeLength > 2 ) {
      for ( int i=1; i<snakeLength; i++ ) {
        if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
          showGameOver();
          return true;
        }
      }
    }
    return false;
  }
