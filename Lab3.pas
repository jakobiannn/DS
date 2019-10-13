Program lab3;

type
  TTime = class
    private
      Hour, Min, Sec: byte;    

    public
      // Инициализация переменных
      constructor Create();
      constructor Create(s: integer);
      constructor Create(H, M, S: byte);
      // Разница в секундах между двумя показателями времени в одни сутки в секундах
      function DiffSec(const T: TTime): integer;

      //Разница во времени между двумя показателями времени в одни сутки
      procedure TimeDiff(const T: TTime);

      procedure Print(); //Вывод текущего заданного времени

      //Сумма двух временных показателей
      procedure Add(const T: TTime);
      
      //Сумма двух временных показателей
      procedure Normalize();
    end;

procedure inputAll(var t: TTime);    
  begin
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

constructor TTime.Create(H, M, S: Integer); //Инициализируем временные показатели
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


var
  n,secs: Integer;
  t1,t2,t3: TTime;
begin
  t1 := TTime.Create;
  t2 := TTime.Create;
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
          t1 := t1.TimeDiff(t2);
          write('Difference is ', t1.Print);
        end;
    2:  begin
          inputAll(t1);
          inputAll(t2);
          t1.DiffSec(t2);
          write('Difference in seconds is ', t1.Print);
        end;
    3:  begin
          inputAll(t1);
          inputAll(t2);

          t1.Create(t1.Hour, t1.Min, t1.Sec);
          t2.Create(t2.Hour, t2.Min, t2.Sec);

          t1.Add(t2);
          write('Sum is ', t1.Print);
        end;
    4:  begin
          inputAll(t1);
          t1.Create(t1.Hour, t1.Min, t1.Sec);
          t1.Print();
        end;
  end;


end.
