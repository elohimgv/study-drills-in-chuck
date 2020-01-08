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
0.3 => wave.gain;
// Set frequency
125 => int f;

for (0 => int i; i < 4; i++) {
    // Set frequencies
    f => wave.freq;
    // Duration to reach the target
    200::ms => env.duration; // Uncomment this expression
    // Ramp to arbitrary  value
    //0.4 => env.target; // Uncomment this expression
    // Turn on the envelop
    env.keyOn();
    // Advance time
    200::ms => now;
    // Turn off the envelope
    env.keyOff();
    200::ms => now;
    
    // Update
    (5+i) +=> f;
}
