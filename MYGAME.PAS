program RacingGame;
uses crt;
const
     screenWidth = 80;
     screenHeight = 25;
     maxObstacles = 10;
var
   carPosX, score: integer;
   obstaclesX: array[1..maxObstacles] of integer;
   obstaclesY: array[1..maxObstacles] of integer;
   i: integer;
   gameOver: boolean;

procedure DisplayGameOver;
begin
     clrscr;
     gotoxy(screenWidth div 2 - 5, screenHeight div 2);
     write('Game Over!');
     gotoxy(screenWidth div 2 - 7, screenHeight div 2 + 1);
     write('Your Score', 'score');
     gotoxy(screenWidth div 2 - 12, screenHeight div 2 + 3);
     write('Press any key to exit...');
     readkey;
end;
begin
     clrscr;
     carPosX := screenWidth div 2;
     score := 0;

     randomize;
     for i := 1 to maxObstacles do
     begin
          obstaclesX[i] := random(screenWidth - 2) + 2;
          obstaclesY[i] := random(screenHeight div 2);
     end;

     while not gameOver do
           begin
                clrscr;

                for i := 1 to screenHeight do
                begin
                     gotoxy(1,i); write('|');
                     gotoxy(screenWidth, i); write('|');
                end;

                gotoxy(carPosX, screenHeight - 2); write('[^]');

                for i := 1 to maxObstacles do
                begin
                     gotoxy(obstaclesX[i], obstaclesY[i]); write('X');
                     obstaclesY[i] := obstaclesY[i] + 1;

                     if obstaclesY[i] > screenHeight then
                     begin
                          obstaclesY[i] := 1;
                          obstaclesX[i] := random(screenWidth - 2) + 2;
                     end;

                     if (obstaclesY[i] = screenHeight - 2) and (obstaclesX[i] = carPosX) then
                     begin
                          gameOver := true;
                     end;
                end;

                if keypressed then
                begin
                     case readkey of
                          'a': if carposX > 2 then carPosX := carPosX - 1;
                          'd' : if carPosX < screenWidth - 2 then carPosX := carPosX + 1;
                     end;
                end;

                gotoxy(1,1); write('Score: ', score);
                score := score + 1;

                delay(50);
           end;
           DisplayGameOver;
end.