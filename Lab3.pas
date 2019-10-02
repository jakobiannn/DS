gram Lab3;

uses crt;

type
  TTime = class(TObject)
    private
      Hour, Min, Sec: Integer;
    public
      // Инициализация переменных
      constructor Create();

      //Ввод времени
      procedure inputAll();

      // Разница в секундах между двумя показателями времени в одни сутки
      procedure DiffSec();

      //Разница во времени между двумя показателями времени в одни сутки
      procedure TimeDiff();

      procedure Print(); //Вывод текущего заданного времени

      //procedure ToString(); //Текущее время в строку

      //Сумма двух временных показателей
      //procedure Add(Seconds: Integer);

      //procedure Add(ATime: TTime);
    end;

constructor Create(); //Инициализируем временные показатели
  begin
    if (Hour or Min or Sec < 0) then 
      begin
        writeln('Error: "Incorrect datas"')
      end
    else 
      begin
        TTime.Hour := 0;
        TTime.Min := 0;
        TTime.Sec := 0;
      end;
    
  end;

procedure TTime.inputAll(); //Задаваемые значения пользователем
  begin
    write('Input hour: ');
      readln(TTime.Hour);

    write('Input min: ');
      readln(TTime.Min);

    write('Input sec: ');
      readln(TTime.Sec);
  end;
 
procedure TDate.Print(var insec: Integer);
  var
    inmin,inhours: Real;
  begin

    inputAll();

    while TTime.Sec > 60 do
      begin
        TTime.Min := TTime.Min + TTime.Sec div 60;
        TTime.Sec := TTime.Sec - (TTime.sec div 60)*60;
      end;

    while TTime.Min > 60 do
      begin
        TTime.Hour := TTime.Hour + TTime.Min div 60;
        TTime.Min := TTime.Min - (TTime.Min div 60)*60;
      end;

   insec := TTime.Hour*3600+TTime.Min*60+TTime.Sec;
   inmin := TTime.Hour*60+TTime.Min+TTime.Sec/60;
   inhours := TTime.Hour+TTime.Min/60+TTime.Sec/3600;

   Wtiteln(inttostr(TTime.Hour) , ' hour, ' , inttostr(TTime.Min) , ' min, ' ,
    inttostr(TTime.Sec) , ' sec. (' , floattostr(insec) , 
    ') sec, (' , floattostr(inmin) , ') min, (' , floattostr(inhours) , ') hours.');

  end;

procedure DiffSec(var s1,s2: Integer);
  begin
    writeln('First indicators: ');
    TDate.Print(s1);

    writeln('Second indicators: ');
    TDate.Print(s2);

    writeln('Difference is ', abs(s1-s2), 'seconds.')
  end;


procedure TimeDiff();
  begin
    Diff(s1,s2);

    TTime.Sec := abs(s1-s2);
    while TTime.Sec > 60 do
      begin
        TTime.Min := TTime.Min + TTime.Sec div 60;
        TTime.Sec := TTime.Sec - (TTime.sec div 60)*60;
      end;

    while TTime.Min > 60 do
      begin
        TTime.Hour := TTime.Hour + TTime.Min div 60;
        TTime.Min := TTime.Min - (TTime.Min div 60)*60;
       end;
    writeln('Difference is ', TTime.Hour, ' hours, ', TTime.Min, ' minutes, ', TTime.Sec, ' seconds.');
  end;

// procedure TDate.DateAdd(h1,m1,s1, h2,m2,s2: Integer; var Answer:String[250]);
//   begin
    
//     Answer := inttostr(abs(h1+h2))+ ' hour, ' + inttostr(abs(m1+m2))+ ' min, ' + inttostr(abs(s1+s2))+ ' sec.';
//   end;

// procedure TDate.DateDiffDays(day1,h1,m1,s1, day2,h2,m2,s2: Integer; var Answer:String[250]);
//   var
//     y,z: integer;
//   begin
//     y := abs(day1 - day2);
//     y := y * 24;
//     z := y + abs(h1-h2);
//     if z < 24 then
//       begin
//       Answer :=
//       inttostr(z)+ ' hour, ' + inttostr(abs(m1-m2))+ ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
//       end
//     else
//       begin
//         Answer :=
//         inttostr(z div 24) + ' days, ' + inttostr(z mod 24)+ ' hour, ' + inttostr(abs(m1-m2))+ ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
//       end;

//   end;


var
  t1, t2: TTime;

begin
  t1 := TTime.Create;

  t1.inputAll();


{
  writeln('Menu:');
  writeln('1) Difference between dates (in one day) ');
  writeln('2) Difference between dates (in few days)');
  writeln('3) Sum of dates');
  writeln('4) Print full date');
  readln(n);
  case n of
    1:  begin
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
          write('Write 2nd date hours: ');
          readln(h2);
          write('Write 2nd date minutes: ');
          readln(m2);
          write('Write 2nd date seconds: ');
          readln(s2);
            clrscr;
          Date1.DateDiff(h1,m1,s1, h2,m2,s2, Answer);
          writeln('Difference is ', Answer);
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
    2:  begin
          write('Write 1st date day: ');
          readln(d1);
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
          write('Write 2nd date day: ');
          readln(d2);
          write('Write 2nd date hours: ');
          readln(h2);
          write('Write 2nd date minutes: ');
          readln(m2);
          write('Write 2nd date seconds: ');
          readln(s2);
            clrscr;
          Date1.DateDiffDays(d1,h1,m1,s1, d2,h2,m2,s2, Answer);
          writeln('Difference is ', Answer);
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
    3:  begin
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
          write('Write 2nd date hours: ');
          readln(h2);
          write('Write 2nd date minutes: ');
          readln(m2);
          write('Write 2nd date seconds: ');
          readln(s2);
            clrscr;
          Date1.DateAdd(h1,m1,s1, h2,m2,s2, Answer);
          writeln('Summ of dates is ', Answer);
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
    4:  begin
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
            clrscr;
          Date1.Print(h1,m1,s1, Answer);
          writeln('Difference is ', Answer);
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
  end;
}

end.
