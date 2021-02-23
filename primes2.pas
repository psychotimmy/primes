program primes(input,output);
(************************************************************)
(*                                                          *)
(* Find primes up to input limit - 255 array size ok for    *)
(* 2.7m-ish. Pascal implementation.                         *)
(*                                                          *)
(* Tim Holyoake, 23rd February 2021                         *)
(*                                                          *)
(* After Trevor Lusty's BASIC program published in          *)
(* Computing Today, March 1980. This version tested on free *)
(* pascal (fpc) on a Raspberry Pi 3a running Buster         *)     
(*                                                          *)
(************************************************************)
var limit, next, primecount: longint;
var primearray: array [1..255] of longint;

function sieve(number: longint; pc: longint; p: array of longint) : boolean;
(************************************************************)
(*                                                          *)
(* Sieve of Eratosthenes algorithm - complexity n log n     *)
(*                                                          *)
(************************************************************)
var sr, count, test: longint;
var foundprime: boolean;

begin
   (* Remove numbers divisible by low primes for speed here *)
   foundprime := true;
   if number = 3*trunc(number/3) then foundprime := false
   else if number = 5*trunc(number/5) then foundprime := false
   else if number = 7*trunc(number/7) then foundprime := false
   else if number = 11*trunc(number/11) then foundprime := false
   else if number = 13*trunc(number/13) then foundprime := false
   else begin
      (* No need to check past the square root of number *)
      (* being tested to see if it is prime              *)
      sr := trunc(sqrt(number));
      count := 1;
      (* If the number has no prime divisor already found *)
      (* it may be the next prime to add to our list      *)
      while ((count <= pc) and foundprime) do begin
         test := p[count];
         if (test <= sr) then
            (* if test below is true, then prime divisor found *)
            (* and so number being tested is not prime *)
            if number = test*trunc(number/test) then foundprime := false;
         count := count + 1
      end;
   end;
   sieve := foundprime;
end;

(* Main program  - handles input and output *)
begin
   writeln('Enter prime number limit - greater than 18');
   readln(limit);
   if (limit > 18) then begin
      primecount := 1;
      primearray[primecount] := 17;
      next := 19;
      write('. 2 3 . 5 . 7 ... 11 . 13 ... 17');
      while (next <= limit) do begin
         if sieve(next,primecount,primearray) then begin
            (* We have a new prime *)
            if primecount < 255 then begin
               (* Add it to our list if there is space for it *)
               (* so that the sieve function can use it in    *)
               (* future prime divisor tests *)
               primecount := primecount + 1;
               primearray[primecount] := next
            end;
            (* Write out a . for the preceeding multiple of 2, *)
            (* followed by the new prime number just found     *)
            write('. ',next,' ')
         end
         else
            (* not prime *)
            write('..');
         (* Sieve odd numbers only *)
         next := next + 2
      end;
      writeln(' ')
   end;
end.
