// Author: Elohim
// program name: sounds-simple-harmonic-movement.ck
/*
* A short description of simple harmonic movement:
*
* My reflection: 
*/

// Sound chain
TriOsc wave => Envelope env => dac;

// Set volume
0.6 => wave.gain;
// Initial frequency
125 => int initialFreq;
// Array to store frequencies
int f[5];
// Variable for track duration
now + 30::second => time duration;
// Pattern to play the frequencies
[0,1,1,2,3,5,8,1,3,
 2,1,3,4,5,5,8,9,1,
 4,4,2,3,3,3,7,7,6,
 1,0,9,8,7,1,5,9,7,
 2,5,8,4,4,1,8,1,6,
 7,6,5,1,0,9,4,6,1,
 7,7,1,1,2,8,6,5,7,
 4,6,3,6,8] @=> int pattern[];
 
// Loop for fill in the array
for (0 => int i; i < 5; i++) {
    // Update data
    initialFreq => f[i];
    5 +=> initialFreq;
}

// Print out data from array
 <<<f[0], f[1], f[2], f[3], f[4]>>>;

// Function
fun void playMelody() {
    0 => int cicle;
    // Loop to repeat the pattern
    while (cicle < 1) {
        0 => int counter; 
        while (counter < pattern.cap()) {
            if (pattern[counter] == 0) {
                f[0] => wave.freq;
                envelope();
            } else if (pattern[counter] == 1) {
                f[1] => wave.freq;
                envelope();
            } else if (pattern[counter] == 2) {
                f[2] => wave.freq;
                envelope();
            } else if (pattern[counter] == 3) {
                f[3] => wave.freq;
                envelope();
            } else if (pattern[counter] == 4) {
                f[4] => wave.freq;
                envelope(); 
            } else if (pattern[counter] == 5) {
                f[0] => wave.freq;
                envelope(); 
            } else if (pattern[counter] == 6) {
                f[1] => wave.freq;
                envelope();
            } else if (pattern[counter] == 7) {
                f[2] => wave.freq;
                envelope();
            } else if (pattern[counter] == 8) {
                f[3] => wave.freq;
                envelope();
            } else {
                f[4] => wave.freq;
                envelope(); 
            }
            counter++;
        }
        cicle++;
    }
}

// Function
fun void envelope() {
    Math.random2(100, 600) => int t;
    // Duration to reach the target
    t::ms => env.duration;
    // Ramp to arbitrary velue
    0.4 => env.target;
    // Turn on the envelope
    env.keyOn();
    // Advance time
    t::ms => now;
    // Shut off the envelope
    env.keyOff();
    150::ms => now;
}

// MAIN PROGRAM
playMelody();
<<<"Track duration: ",(duration - now)/second>>>;




