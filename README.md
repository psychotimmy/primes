# primes
RC2014 BASIC - Sieve of Eratosthenes prime number generator

Primes.bas: The 32K RAM RC2014 Classic ][ has enough memory to generate the prime numbers between 2 and 7,842 using this algorithm.

Primes2.bas: A different implementation, approximately 35% slower than Primes.bas for finding the primes up to 7,500, but capable of finding all the primes up to 2.7 million-ish with the array size specified (255, so that the code will run with minimal changes on a Sharp MZ-80K running BASIC SP-5025).

Primes2.pas: A Pascal implementation of Primes2.bas, suitable for the Free Pascal compiler found on many linux ports - e.g. Raspberry Pi Buster.

