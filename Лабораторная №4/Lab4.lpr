Program Lab4;
      {Str.PAS}

// Класс временных показателей в формате hh:mm:ss

// Реализует простые арифметические операции над заданными
// показателями и приводит их к нормальному виду

// в структуре класса реализуются различные конструкторы
// (по умолчанию, заданием секунд, общим заданием всех показателей)

// реализованы прегрузки простейших операций

type
  TTime = class
    private
      Hour, Min, Sec: byte;

      //создадим переменную хранящую true, если сейчас день,
      //false - если ночь
      Day: boolean;
    public
      // Инициализация переменных
      constructor Create();
      constructor Create(s: integer);
      constructor Create(H, M, S: byte);

      // Разница в секундах между двумя показателями времени в одни сутки в секундах
      function DiffSec(const T: TTime): integer;

      //Разница во времени между двумя показателями времени в одни сутки
      function TimeDiff(const T: TTime): TTime;

      procedure Print(); //Вывод текущего заданного времени

      //Сумма двух временных показателей
      procedure Add(const T: TTime);

      //Приведение временных показателей к нормальному виду
      procedure Normalize();

      // Представление в дипазоне 0 .. 23
      procedure in23();

      // Представление в формате 0 .. 11 (pm/am)
      procedure in11();
    end;

procedure inputAll(var t: TTime); //По умолчанию ввод будет в формате 24
  begin
    writeln('Take yout time (in 24 format)');
    write('Input hour: ');
    readln(t.Hour);

    write('Input min: ');
    readln(t.Min);

    write('Input sec: ');
    readln(t.Sec);
  end;

constructor TTime.Create(); //Инициализируем временные показатели
begin
  Hour := 0;
  Min := 0;
  Sec := 0;
end;

procedure TTime.Normalize();
begin
  Min := Min + Sec div 60;

  Sec := Sec Mod 60;

  Hour := Hour + Min div 60;

  Min := Min mod 60;
end;

constructor TTime.Create(s: integer);
begin
  Hour := 0;
  Min := 0;
  Sec := s;

  Normalize;
end;

constructor TTime.Create(H, M, S: Byte); //Инициализируем временные показатели
begin
  Hour := H;
  Min := M;
  Sec := S;
end;

procedure TTime.Print();
begin
   Write(Hour , ' hour, ' ,Min , ' min, ' , Sec , ' sec. ');
end;

function TTime.DiffSec(const T: TTime): integer;
begin
  Result := abs((-Hour+T.Hour)*60*60 + (-Min+T.Min)*60 + (-Sec+T.Sec));
end;


function TTime.TimeDiff(const T: TTime): TTime;
begin
  Result := TTime.Create(DiffSec(T));
end;

procedure TTime.Add(const T: TTime);
begin
  Hour := Hour + T.Hour;
  Min := Min + T.Min;
  Sec := Sec + T.Sec;
end;

procedure TTime.in23();
begin
     if Day then Hour := Hour + 12;
     Print();
end;

procedure TTime.in11();
begin
     if Hour > 12 then
        Hour := Hour - 12;

     Print();

     if Day then
       Writeln('(am)')
     else
       Writeln('(pm)');
end;

operator + (t1 , t2: TTime)r: TTime;
begin
     t1.Add(t2);
     t1.Normalize();
     r := t1;


end;

operator - (t1 , t2: TTime)r: TTime;
begin
     t1.Diffsec(t2);
     t1.Normalize;
     r := t1;
end;


operator > (t1 , t2: TTime)r: boolean;
begin
     if t1.DiffSec(t2) > 0 then
       Result := true;
end;

operator < (t1 , t2: TTime)r: boolean;
begin
     if t1.DiffSec(t2) = 0 then
       r := true;
end;

var
  n: Integer;
  t1,t2,t3: TTime;

begin
  t1 := TTime.Create;
  t2 := TTime.Create;
  t3 := TTime.Create;
  writeln('Menu:');
  writeln('1) Difference between times');
  writeln('2) Difference between times (in seconds)');
  writeln('3) Sum of dates');
  writeln('4) Print full date');
  readln(n);
  case n of
    1:  begin
          inputAll(t1);
          inputAll(t2);

          t1.Create(t1.Hour, t1.Min, t1.Sec);
          t2.Create(t2.Hour, t2.Min, t2.Sec);

          t3 := t1 - t2;
          write('Difference is ');
          t3.Print;
        end;
    2:  begin
          inputAll(t1);
          inputAll(t2);

          t1.DiffSec(t2);
          write('Difference in seconds is ');
          t1.Print;
        end;
    3:  begin
          inputAll(t1);
          inputAll(t2);

          t1.Create(t1.Hour, t1.Min, t1.Sec);
          t2.Create(t2.Hour, t2.Min, t2.Sec);

          t1 := t1 + t2;
          write('Sum is ');
          t1.Print;
        end;
    4:  begin
          inputAll(t1);
          t1.Create(t1.Hour, t1.Min, t1.Sec);
          t1.in11();
          t1.Print();
        end;
  end;

        readln;
end.
