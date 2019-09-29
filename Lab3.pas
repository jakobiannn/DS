Program lab3;

type
  TDate = class
    private
    Hour,Min,Sec:integer;
    
    procedure inputAll(Hour,Min,Sec:Integer); //Ввод времени
    public
    
    function DateDiff(h1,m1,s1, h2,m2,s2: Integer):String[100]; //Разница между двумя показателями времени в одни сутки
    function Print(h1,m1,s1:integer):String; //Вывод текущего заданного времени
    function DateAdd(h1,m1,s1, h2,m2,s2: Integer):String; //Сумма двух временных показателей
    function DateDiffDays(day1,h1,m1,s1, day2,h2,m2,s2: Integer):String; //Разница между двумя показателями времени в разные дни
    end;


procedure TDate.inputAll(Hour,Min,Sec: Integer);
  begin
    write('Input hour: ');
    readln(hour);
    write('Input min: ');
    readln(min);
    write('Input sec: ');
    readln(sec);
  end;

function TDate.Print(h1,m1,s1: Integer):String;
  var
    insec,inmin,inhours: Real;
  begin
   inputAll(h1,m1,s1);
   insec := h1*60*60+m1*60+s1;
   inmin := h1*60+m1+s1/60;
   inhours := h1+m1/60+(s1/60)/60;
   Print := inttostr(h1) + ' hour, ' + inttostr(m1) + ' min, ' + inttostr(s1) + ' sec. (' + floattostr(insec) +
    ') sec, (' + floattostr(inmin) + ') min, (' + floattostr(inhours) + ') hours.';
  end;

function TDate.DateDiff(h1,m1,s1, h2,m2,s2: Integer):String[100];
  begin
    inputALL(h1,m1,s1);
    inputALL(h2,m2,s2);
    
    DateDiff  := inttostr(abs(h1-h2)) + ' hour, ' + inttostr(abs(m1-m2)) + ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
  end;

function TDate.DateAdd(h1,m1,s1, h2,m2,s2: Integer):String;
  begin
    inputALL(h1,m1,s1);
    inputALL(h2,m2,s2);
    DateAdd := inttostr(abs(h1+h2))+ ' hour, ' + inttostr(abs(m1+m2))+ ' min, ' + inttostr(abs(s1+s2))+ ' sec.';
  end;

function TDate.DateDiffDays(day1,h1,m1,s1, day2,h2,m2,s2: Integer): String;
  var
    y,z: integer;
  begin
    y := abs(day1 - day2);
    y := y * 24;
    z := y + abs(h1-h2);
    if z < 24 then
      begin
      DateDiffDays :=  
      inttostr(z)+ ' hour, ' + inttostr(abs(m1-m2))+ ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
      end
    else 
      begin
        DateDiffDays := 
        inttostr(z div 24) + ' days, ' + inttostr(z mod 24)+ ' hour, ' + inttostr(abs(m1-m2))+ ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
      end;

  end;

var
  Date1: TDate;
  Answer: String;
  h1,m1,s1,h2,m2,s2,d1,d2, n: Integer;

begin

  writeln('Menu:');
  writeln('1) Difference between dates (in one day) ');
  writeln('2) Difference between dates (in few days)');
  writeln('3) Sum of dates');
  writeln('4) Print full date');
  readln(n);
  case n of
    1:  begin 
          writeln('Write 1st date hours');
          readln(h1);
          writeln('Write 1st date minutes');
          readln(m1);
          writeln('Write 1st date seconds');
          readln(s1);
          writeln('Write 2nd date hours');
          readln(h2);
          writeln('Write 2nd date minutes');
          readln(m2);
          writeln('Write 2nd date seconds');
          readln(s2);
          writeln('Difference is ', Date1.DateDiff(h1,m1,s1, h2,m2,s2));
        end;
    2:  begin
          writeln('Write 1st date day');
          readln(d1);
          writeln('Write 1st date hours');
          readln(h1);
          writeln('Write 1st date minutes');
          readln(m1);
          writeln('Write 1st date seconds');
          readln(s1);
          writeln('Write 2nd date day');
          readln(d2);
          writeln('Write 2nd date hours');
          readln(h2);
          writeln('Write 2nd date minutes');
          readln(m2);
          writeln('Write 2nd date seconds');
          readln(s2);
          writeln('Difference is ', Date1.DateDiffDays(d1,h1,m1,s1, d2,h2,m2,s2));
        end;
    3:  begin
          writeln('Write 1st date hours');
          readln(h1);
          writeln('Write 1st date minutes');
          readln(m1);
          writeln('Write 1st date seconds');
          readln(s1);
          writeln('Write 2nd date hours');
          readln(h2);
          writeln('Write 2nd date minutes');
          readln(m2);
          writeln('Write 2nd date seconds');
          readln(s2);
          writeln('Summ of dates is ', Date1.DateAdd(h1,m1,s1, h2,m2,s2));
        end;
    4:  begin
          writeln('Write 1st date hours');
          readln(h1);
          writeln('Write 1st date minutes');
          readln(m1);
          writeln('Write 1st date seconds');
          readln(s1);
          writeln('Write 2nd date hours');
          readln(h2);
          writeln('Write 2nd date minutes');
          readln(m2);
          writeln('Write 2nd date seconds');
          readln(s2);

          writeln('Difference is ', Date1.Print(h1,m1,s1));
        end;
  end;


end.
