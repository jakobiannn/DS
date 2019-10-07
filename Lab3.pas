Program Lab3;

uses crt;

type
  TTime = class
    private
      Hour, Min, Sec: Integer;

      procedure inputAll();

    public
      // Инициализация переменных
      constructor Create();

      // Разница в секундах между двумя показателями времени в одни сутки в секундах
      procedure DiffSec();

      //Разница во времени между двумя показателями времени в одни сутки
      procedure TimeDiff();

      procedure Print(var insec: Integer); //Вывод текущего заданного времени

      //Сумма двух временных показателей
      procedure Add();

      
    end;

constructor TTime.Create(); //Инициализируем временные показатели
var
  t1:TTime;
  begin
    if (t1.Hour or t1.Min or t1.Sec < 0) then 
      begin
        writeln('Error: "Incorrect datas"')
      end
    else 
      begin
        t1.Hour := 0;
        t1.Min := 0;
        t1.Sec := 0;
      end;
    
  end;

procedure TTime.inputAll(); //Задаваемые значения пользователем
var
 t1:TTime;
  begin
    write('Input hour: ');
      readln(t1.Hour);

    write('Input min: ');
      readln(t1.Min);

    write('Input sec: ');
      readln(t1.Sec);
  end;
 
procedure TTime.Print(var insec: Integer);
  var
    t1:TTime;
    inmin,inhours: Real;
  begin

    inputAll();

    while t1.Sec > 60 do
      begin
        t1.Min := t1.Min + t1.Sec div 60;
        t1.Sec := t1.Sec - (t1.sec div 60)*60;
      end;

    while t1.Min > 60 do
      begin
        t1.Hour := t1.Hour + t1.Min div 60;
        t1.Min := t1.Min - (t1.Min div 60)*60;
      end;

   insec := t1.Hour*3600 + t1.Min*60 + t1.Sec;
   inmin := t1.Hour*60 + t1.Min + t1.Sec/60;
   inhours := t1.Hour + t1.Min/60 + t1.Sec/3600;

   Writeln(t1.Hour , ' hour, ' ,t1.Min , ' min, ' ,
    t1.Sec , ' sec. (' , insec , 
    ') sec, (' , inmin , ') min, (' , inhours , ') hours.');

  end;

procedure TTime.DiffSec();
  var
    s1,s2:Integer;
    t1: TTime;
  begin
    writeln('First indicators: ');
    t1.Print(s1);

    writeln('Second indicators: ');
    t1.Print(s2);

    writeln('Difference is ', abs(s1-s2), 'seconds.')
  end;


procedure TTime.TimeDiff();
  var
    t1: TTime;
    s1,s2: Integer;
  begin
    t1.TimeDiff();

    t1.Sec := abs(s1-s2);
    while t1.Sec > 60 do
      begin
        t1.Min := t1.Min + t1.Sec div 60;
        t1.Sec := t1.Sec - (t1.sec div 60)*60;
      end;

    while t1.Min > 60 do
      begin
        t1.Hour := t1.Hour + t1.Min div 60;
        t1.Min := t1.Min - (t1.Min div 60)*60;
       end;
    writeln('Difference is ', t1.Hour, ' hours, ', t1.Min, ' minutes, ', t1.Sec, ' seconds.');
  end;

procedure TTime.Add();
  var
    t1: TTime;
    s1,s2: Integer;
  begin
    writeln('First indicators: ');
    t1.Print(s1);

    writeln('Second indicators: ');
    t1.Print(s2);

    t1.Sec := s1 + s2;

    while t1.Sec > 60 do
      begin
        t1.Min := t1.Min + t1.Sec div 60;
        t1.Sec := t1.Sec - (t1.sec div 60)*60;
      end;

    while t1.Min > 60 do
      begin
        t1.Hour := t1.Hour + t1.Min div 60;
        t1.Min := t1.Min - (t1.Min div 60)*60;
       end;
    writeln('Summ is ', t1.Hour, ' hours, ', t1.Min, ' minutes, ', t1.Sec, ' seconds.');
  end;



var
  t1: TTime;
  n,secs: Integer;
begin
  t1 := TTime.Create;

  writeln('Menu:');
  writeln('1) Difference between dates');
  writeln('2) Difference between dates (in seconds)');
  writeln('3) Sum of dates');
  writeln('4) Print full date');
  readln(n);
  case n of
    1:  begin
          t1.TimeDiff();
        end;
    2:  begin
          t1.DiffSec();
        end;
    3:  begin
          t1.Add();
        end;
    4:  begin
          t1.Print(secs);
        end;
  end;


end.
