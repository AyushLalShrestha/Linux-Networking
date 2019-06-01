
<!-- Basic DH key generation formula -->
1. (P ^ x) (mod Q) where P and Q are constants


<!-- RSA Encryption -->
1. n = p * q where p and q are private to the server
2. n and e (another small random prime number) are publicly distributed

   <!-- While encryption the sender does -->
   EncMessage = (message ^ e) (mod n)

   <!-- At the receiver side with private keys p and q, variable D is calculated -->
   (D * e) (mod ((p - 1) * (q - 1))) = 1

   <!-- While decryption of the message -->
   message = (EncMessage ^ e) (mod n)
