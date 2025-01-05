// Postavi RAM[5] na veliki broj (pretpostavimo 32767 kao maksimum na Hack računaru)
@32767
D = A
@5
M = D    // RAM[5] = 32767

// Početak petlje: i = 0
@0
D = A
@13
M = D    // RAM[13] = i (iterator)

// Petlja za iteraciju kroz RAM[0] do RAM[4]
(LOOP)
@13
D = M    // D = i
@5
D = D-A  // Ako je i >= 5, završi petlju
@END
D; JGE

// Učitaj RAM[i] i proveri da li je pozitivan
@13
D = M    // D = i
@0
A = A+D  // A = RAM[i]
D = M    // D = RAM[i]

// Ako je RAM[i] <= 0, preskoči
@SKIP
D; JLE

// Proveri da li je RAM[i] manji od trenutnog minimuma (RAM[5])
@5
A = M    // A = RAM[5]
D = D-A  // D = RAM[i] - RAM[5]
@SKIP
D; JGE   // Ako RAM[i] >= RAM[5], preskoči

// Ažuriraj RAM[5] sa RAM[i] (novi minimum)
@13
D = M    // D = i
@0
A = A+D  // A = RAM[i]
D = M    // D = RAM[i]
@5
M = D    // RAM[5] = RAM[i]

// Nastavi dalje
(SKIP)
@13
M = M+1  // i = i + 1
@LOOP
0; JMP   // Idi na sledeći element

// Završetak programa
(END)
@END
0; JMP