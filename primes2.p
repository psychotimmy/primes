(************************************************************)
(*                                                          *)
(* Find primes up to input limit - 255 array size ok for    *)
(* 2.7m-ish. Pascal implementation.                         *)
(*                                                          *)
(* Tim Holyoake, 22nd February 2021                         *)
(*                                                          *)
(* After Trevor Lusty's BASIC program published in          *)
(* Computing Today, March 1980. This version tested on free *)
(* pascal (fpc) on a Raspberry Pi 3a running Buster         *)     
(*                                                          *)
(************************************************************)
program primes(input,output);
var limit, next,primecount: longint;
var p: array [1..255] of longint;

(************************************************************)
(*                                                          *)
(* Sieve of Eratosthenes algorithm - complexity n log n     *)
(*                                                          *)
(************************************************************)
procedure sieve(number: longint);
var sr, count, test: longint;
var foundprime: boolean;

begin
   (* Remove numbers divisible by low primes for speed here *)
   if number = 3*trunc(number/3) then write ('..')
   else if number = 5*trunc(number/5) then write ('..')
   else if number = 7*trunc(number/7) then write ('..')
   else if number = 11*trunc(number/11) then write ('..')
   else if number = 13*trunc(number/13) then write ('..')
   else begin
      (* No need to check past the square root of number *)
      (* being tested to see if it is prime              *)
      sr := trunc(sqrt(number));
      count := 1;
      foundprime := true;
      (* If the number has no prime divisor already found *)
      (* it is the next prime to add to our list          *)
      while ((count <= primecount) and foundprime) do begin
         test := p[count];
         if (test <= sr) then begin
            if number = test*trunc(number/test) then begin
               write('..');
               foundprime := false;
            end;
         end;
         count := count + 1
      end;
      (* We have a new prime *)
      if foundprime then begin
         if primecount < 255 then begin
            (* Add it to our list if there is space for it *)
            primecount := primecount + 1;
            p[primecount] := number
         end;
         (* Write out a . for the preceeding multiple of 2, *)
         (* followed by the new prime number just found     *)
         write('. ',number,' ')
      end;
   end;
end;

begin
   writeln('Enter prime number limit - greater than 18');
   readln(limit);
   if (limit > 18) then begin
      primecount := 1;
      p[primecount] := 17;
      next := 19;
      write('. 2 3 . 5 . 7 ... 11 . 13 ... 17');
      while (next <= limit) do begin
         (* Sieve odd numbers only *)
         sieve(next);
         next := next + 2
      end;
      writeln(' ')
   end;
end.
