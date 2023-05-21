program SampleProgram;

uses
  SysUtils;

var
  x, y: Integer;

function AddNumbers(a, b: Integer): Integer;
begin
  Result := a + b;
end;

procedure PrintMessage();
begin
  writeln('Hello, World!');
end;

begin
  writeln('Program started.');

  x := 10;
  y := 5;

  if x > y then
    writeln('x is greater than y')
  else
    writeln('x is not greater than y');

  while x > 0 do
  begin
    writeln('Countdown: ', x);
    x := x - 1;
  end;

  repeat
    writeln('Repeat until loop: ', y);
    y := y - 1;
  until y = 0;

  writeln('Sum of 2 and 3 is: ', AddNumbers(2, 3));

  PrintMessage();

  writeln('Program ended.');
end.
