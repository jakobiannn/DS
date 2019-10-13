Program lab3;

uses crt;

type
  TTime = class
    private
      Hour, Min, Sec: byte;    

    public
      // Инициализация переменных
      constructor Create();
      constructor Create(s: integer);
      constructor Create(H, M, S: byte);
      //constructor Create(T: TTime);
      //constructor Create(S: string);  //hh:mm:ss  
      procedure inputAll(var t: TTime); //ввод
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

constructor TTime.Create(H, M, S: byte); //Инициализируем временные показатели
begin
  Hour := H;
  Min := M;
  Sec := S;
end;

procedure TTime.Print();
begin
   Writeln(Hour , ' hour, ' ,Min , ' min, ' , Sec , ' sec. ');
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
          t1.inputAll();
          t2.inputAll();
          t1 := t1.TimeDiff(t2);
          writeln('Difference is ', t1.Print);
        end;
    2:  begin
          t1.inputAll();
          t2.inputAll();
          t1.DiffSec(t2);
          writeln('Difference in seconds is ', t1.Print);
        end;
    3:  begin
          t1.inputAll();
          t2.inputAll();
          t1.Add(t2);
          writeln('Sum is ', t1.Print);
        end;
    4:  begin
          t1.inputAll();
          t1.Normalize();
          t1.Print();
        end;
  end;


end.
